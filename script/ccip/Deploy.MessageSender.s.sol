// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Utils} from "../../contracts/utils/Utils.sol";
import {MessageSender} from "../../contracts/ccip/MessageSender.sol";

contract DeployMessageSenderScript is Utils {
    MessageSender public sender;
    uint256 deployerPrivateKey;

    function run() public {
        if (block.chainid == 31337) {
            deployerPrivateKey = vm.envUint("ANVIL_PRIVATE_KEY");
        } else {
            deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        }
        vm.broadcast();
        sender = new MessageSender(getValue("routerAddress"), getValue("linkAddress"));
    }
}
