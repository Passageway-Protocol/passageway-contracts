// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import {NFT} from "../../../contracts/optimism/tokens/ERC721.sol";

contract NFTScript is Script {
    string name;
    string symbol;
    NFT nft;

    function run() public {
        vm.broadcast();
        nft = new NFT(name, symbol);
        console.log("NFTScript: NFT deployed at %s", address(nft));
    }
}
