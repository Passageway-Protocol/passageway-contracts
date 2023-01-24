# L2CDMMock
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/optimism/mocks/L2CDMMock.sol)


## State Variables
### l1TokenBridge

```solidity
address public l1TokenBridge;
```


## Functions
### constructor


```solidity
constructor(address _l1TokenBridge);
```

### sendMessage


```solidity
function sendMessage(address _target, bytes memory _message, uint32 _gasLimit) external;
```

### xDomainMessageSender


```solidity
function xDomainMessageSender() external view returns (address);
```

## Events
### MessageSent

```solidity
event MessageSent(address indexed _target, bytes _message, uint32 _gasLimit);
```

