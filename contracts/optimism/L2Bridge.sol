// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {IL1ERC721Bridge} from "./interfaces/IL1ERC721Bridge.sol";
import {IL2ERC721Bridge} from "./interfaces/IL2ERC721Bridge.sol";
import {IL2StandardERC721} from "./interfaces/IL2StandardERC721.sol";
import {Clone} from "../lib/Clone.sol";

import {ERC165Checker} from "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";
import {CrossDomainEnabled} from "@optimism/contracts/libraries/bridge/CrossDomainEnabled.sol";
import {IERC721Receiver} from "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

/**
 * @title L2Bridge
 */
contract L2Bridge is IL2ERC721Bridge, CrossDomainEnabled, IERC721Receiver, Clone {
    address public l1TokenBridge;
    address public tokenTemplate;
    mapping(address => address) public tokenMapping;

    /**
     * @param _l2CrossDomainMessenger Cross-domain messenger used by this contract.
     * @param _l1TokenBridge Address of the L1 bridge deployed to the main chain.
     */
    constructor(address _l2CrossDomainMessenger, address _l1TokenBridge, address _tokenTemplate)
        CrossDomainEnabled(_l2CrossDomainMessenger)
    {
        l1TokenBridge = _l1TokenBridge;
        tokenTemplate = _tokenTemplate;
    }

    /**
     * @inheritdoc IL2ERC721Bridge
     */
    function withdraw(address _l2Token, uint256 _tokenId, uint32 _l1Gas, bytes calldata _data) external virtual {
        _initiateWithdrawal(_l2Token, l1TokenBridge, msg.sender, _tokenId, _l1Gas, _data);
    }

    /**
     * @inheritdoc IL2ERC721Bridge
     */
    function withdrawTo(address _l2Token, address _to, uint256 _tokenId, uint32 _l1Gas, bytes calldata _data)
        external
        virtual
    {
        _initiateWithdrawal(_l2Token, l1TokenBridge, _to, _tokenId, _l1Gas, _data);
    }

    /**
     * @dev Performs the logic for withdrawals by burning the token and informing
     *      the L1 token Gateway of the withdrawal.
     * @param _l2Token Address of L2 token where withdrawal is initiated.
     * @param _from Account to pull the withdrawal from on L2.
     * @param _to Account to give the withdrawal to on L1.
     * @param _tokenId Token ID to withdraw.
     * @param _l1Gas Gas limit for the L1 transaction.
     * @param _data Optional data to forward to L1.
     */
    function _initiateWithdrawal(
        address _l2Token,
        address _from,
        address _to,
        uint256 _tokenId,
        uint32 _l1Gas,
        bytes calldata _data
    ) internal {
        // slither-disable-next-line reentrancy-events
        IL2StandardERC721(_l2Token).burn(msg.sender, _tokenId);

        // slither-disable-next-line reentrancy-events
        address l1Token = IL2StandardERC721(_l2Token).l1Token();
        bytes memory message;

        message = abi.encodeWithSelector(
            IL1ERC721Bridge.finalizeERC721Withdrawal.selector, l1Token, _l2Token, _from, _to, _tokenId, _data
        );

        // slither-disable-next-line reentrancy-events
        sendCrossDomainMessage(l1TokenBridge, _l1Gas, message);

        // slither-disable-next-line reentrancy-events
        emit WithdrawalInitiated(l1Token, _l2Token, msg.sender, _to, _tokenId, _data);
    }

    /**
     * @inheritdoc IL2ERC721Bridge
     */
    function finalizeDeposit(address _l1Token, address _from, address _to, uint256 _tokenId, bytes calldata _data)
        external
        virtual
        onlyFromCrossDomainAccount(l1TokenBridge)
    {
        (string memory name, string memory symbol, string memory tokenURI) = abi.decode(_data, (string, string, string));
        address l2Token = tokenMapping[_l1Token];
        if (l2Token == address(0x0)) {
            // create a new child token
            bytes32 salt = keccak256(abi.encodePacked(_l1Token));
            l2Token = createClone(salt, tokenTemplate);
            tokenMapping[_l1Token] = l2Token;
            IL2StandardERC721(l2Token).initialize(address(this), _l1Token, name, symbol);
        }
        if (_l1Token == IL2StandardERC721(l2Token).l1Token()) {
            // slither-disable-next-line reentrancy-events
            IL2StandardERC721(l2Token).mint(_to, _tokenId, tokenURI);
            // slither-disable-next-line reentrancy-events
            emit DepositFinalized(_l1Token, l2Token, _from, _to, _tokenId, _data);
        } else {
            // send token back to L1
            bytes memory message = abi.encodeWithSelector(
                IL1ERC721Bridge.finalizeERC721Withdrawal.selector, _l1Token, _to, _from, _tokenId, _data
            );

            // slither-disable-next-line reentrancy-events
            sendCrossDomainMessage(l1TokenBridge, 0, message);
            // slither-disable-next-line reentrancy-events
            emit DepositFailed(_l1Token, _from, _to, _tokenId, _data);
        }
    }

    // used for testing
    function _finalizeDeposit(address _l1Token, address _from, address _to, uint256 _tokenId, bytes calldata _data)
        external
        virtual
    {
        (string memory name, string memory symbol, string memory tokenURI) = abi.decode(_data, (string, string, string));
        address childToken = tokenMapping[_l1Token];
        if (childToken == address(0x0)) {
            // create a new child token
            bytes32 salt = keccak256(abi.encodePacked(_l1Token));
            childToken = createClone(salt, tokenTemplate);
            tokenMapping[_l1Token] = childToken;
            IL2StandardERC721(childToken).initialize(address(this), _l1Token, name, symbol);
        }
        if (_l1Token == IL2StandardERC721(childToken).l1Token()) {
            // slither-disable-next-line reentrancy-events
            IL2StandardERC721(childToken).mint(_to, _tokenId, tokenURI);
            // slither-disable-next-line reentrancy-events
            emit DepositFinalized(_l1Token, childToken, _from, _to, _tokenId, _data);
        } else {
            bytes memory message = abi.encodeWithSelector(
                IL1ERC721Bridge.finalizeERC721Withdrawal.selector, _l1Token, _to, _from, _tokenId, _data
            );

            // slither-disable-next-line reentrancy-events
            sendCrossDomainMessage(l1TokenBridge, 0, message);
            // slither-disable-next-line reentrancy-events
            emit DepositFailed(_l1Token, _from, _to, _tokenId, _data);
        }
    }

    function onERC721Received(
        address, /* operator */
        address, /* from */
        uint256, /* tokenId */
        bytes calldata /* data */
    ) external pure override returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
