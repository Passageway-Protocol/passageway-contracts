// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Utils} from "../../contracts/utils/Utils.sol";
import {MessageReceiver} from "../../contracts/ccip/MessageSender.sol";

contract DeployMessageReceiverScript is Utils {
    MessageSender public sender;
    uint256 deployerPrivateKey;

    function run() public {
        if (block.chainid == 31337) {
            deployerPrivateKey = vm.envUint("ANVIL_PRIVATE_KEY");
        } else {
            deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        }
        vm.broadcast();
        sender = new MessageReceiver(getValue("routerAddress"));
    }
}
