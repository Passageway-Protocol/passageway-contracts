// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import {L2StandardERC721} from "../../../contracts/optimism/tokens/L2StandardERC721.sol";

contract L2StandardERC721Script is Script {
    L2StandardERC721 erc721;

    function run() public {
        vm.broadcast();
        erc721 = new L2StandardERC721();
        console.log("Contract deployed at %s", address(erc721));
    }
}
