# XStateChildTunnel
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/polygon/stateTransfer/StateChildTunnel.sol)

**Inherits:**
FxBaseChildTunnel


## State Variables
### latestStateId

```solidity
uint256 public latestStateId;
```


### latestRootMessageSender

```solidity
address public latestRootMessageSender;
```


### latestData

```solidity
bytes public latestData;
```


## Functions
### constructor


```solidity
constructor(address xChild) FxBaseChildTunnel(xChild);
```

### _processMessageFromRoot


```solidity
function _processMessageFromRoot(uint256 stateId, address sender, bytes memory data)
    internal
    override
    validateSender(sender);
```

### sendMessageToRoot


```solidity
function sendMessageToRoot(bytes memory message) public;
```

