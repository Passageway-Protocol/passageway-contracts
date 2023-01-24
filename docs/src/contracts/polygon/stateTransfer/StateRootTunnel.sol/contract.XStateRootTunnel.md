# XStateRootTunnel
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/polygon/stateTransfer/StateRootTunnel.sol)

**Inherits:**
FxBaseRootTunnel


## State Variables
### latestData

```solidity
bytes public latestData;
```


## Functions
### constructor


```solidity
constructor(address _checkpointManager, address xRoot) FxBaseRootTunnel(_checkpointManager, xRoot);
```

### _processMessageFromChild


```solidity
function _processMessageFromChild(bytes memory data) internal override;
```

### sendMessageToChild


```solidity
function sendMessageToChild(bytes memory message) public;
```

