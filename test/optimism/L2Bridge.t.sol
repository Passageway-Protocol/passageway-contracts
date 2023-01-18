// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {L2StandardERC721} from "../../contracts/optimism/tokens/L2StandardERC721.sol";
import {L1CDMMock} from "../../contracts/optimism/mocks/L1CDMMock.sol";
import {L2CDMMock} from "../../contracts/optimism/mocks/L2CDMMock.sol";
import {NFT} from "../../contracts/optimism/tokens/ERC721.sol";
import {L1Bridge} from "../../contracts/optimism/L1Bridge.sol";
import {L2Bridge} from "../../contracts/optimism/L2Bridge.sol";


contract L2BridgeTest is Test {
    address admin;
    L1CDMMock l1Messenger;
    L2CDMMock l2Messenger;
    L2StandardERC721 l2Standard721;
    NFT nft;
    L2StandardERC721 nftl2;
    L2StandardERC721 template;
    L1Bridge l1Bridge;
    L2Bridge l2Bridge;
    function setUp() public {
        admin = vm.envAddress("LOCAL_ADMIN");
        vm.startPrank(admin);
        l1Messenger = new L1CDMMock();
        
        l2Standard721 = new L2StandardERC721();
        nft = new NFT("Cool NFT's", "CNFT");
        template = new L2StandardERC721();
        l1Bridge = new L1Bridge();
        l2Messenger = new L2CDMMock(address(l1Bridge));
        l2Bridge = new L2Bridge(address(l1Bridge), address(l2Messenger), address(l2Standard721));
        l1Bridge.initialize(address(l2Messenger), address(l2Bridge), address(l2Standard721));
    }

    function testFinalizeDeposit() public {
        string memory name = "NFT WORLD";
        string memory symbol = "NFTW";
        string memory uri = "https://nftworld.com/0";
        bytes memory data = abi.encode(name, symbol, uri);
        l2Bridge._finalizeDeposit(address(nft), admin, admin, 0, data);
        address l2tokenAddress = l2Bridge.tokenMapping(address(nft));
        nftl2 = L2StandardERC721(l2tokenAddress);
        assertEq(nftl2.tokenURI(0), uri);
        assertEq(nftl2.ownerOf(0), admin);
    }
}
