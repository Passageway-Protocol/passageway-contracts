// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {L2StandardERC721} from "../../contracts/optimism/tokens/L2StandardERC721.sol";
import {L1CDMMock} from "../../contracts/optimism/mocks/L1CDMMock.sol";
import {NFT} from "../../contracts/optimism/tokens/ERC721.sol";
import {L1Bridge} from "../../contracts/optimism/L1Bridge.sol";
import {L2Bridge} from "../../contracts/optimism/L2Bridge.sol";


contract L1BridgeTest is Test {
    address admin;
    L1CDMMock l1Messenger;
    address l2Messenger;
    L2StandardERC721 l2Standard721;
    NFT nft;
    L2StandardERC721 template;
    L1Bridge l1Bridge;
    L2Bridge l2Bridge;
    function setUp() public {
        admin = vm.envAddress("LOCAL_ADMIN");
        vm.startPrank(admin);
        l1Messenger = new L1CDMMock();
        l2Messenger = 0x4200000000000000000000000000000000000007;
        l2Standard721 = new L2StandardERC721();
        nft = new NFT("Cool NFT's", "CNFT");
        template = new L2StandardERC721();
        l1Bridge = new L1Bridge();
        l2Bridge = new L2Bridge(address(l1Bridge), l2Messenger, address(l2Standard721));
        l1Bridge.initialize(address(l1Messenger), address(l2Bridge), address(template));
    }

    function testDeposit() public {
        nft.setApprovalForAll(address(l1Bridge), true);
        l1Bridge.depositERC721(address(nft), 0, 10000000, "0x");
        assertEq(nft.ownerOf(0), address(l1Bridge));
    }

    function testWithdraw() public {
        
    }
}
