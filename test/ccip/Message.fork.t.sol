// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Utils} from "../../contracts/utils/Utils.sol";

contract MessageForkTest is Utils, Test {
    uint256 network;

    function setUp() public {
        network = vm.createSelectFork(vm.rpcUrl("arbitrum"));
    }
}
