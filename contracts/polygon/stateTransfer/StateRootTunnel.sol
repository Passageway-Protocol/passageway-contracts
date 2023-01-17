// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {FxBaseRootTunnel} from "@fx-portal/contracts/tunnel/FxBaseRootTunnel.sol";

/**
 * @title XStateRootTunnel
 */
contract XStateRootTunnel is FxBaseRootTunnel {
    bytes public latestData;

    constructor(address _checkpointManager, address xRoot) FxBaseRootTunnel(_checkpointManager, xRoot) {}

    function _processMessageFromChild(bytes memory data) internal override {
        latestData = data;
    }

    function sendMessageToChild(bytes memory message) public {
        _sendMessageToChild(message);
    }
}
