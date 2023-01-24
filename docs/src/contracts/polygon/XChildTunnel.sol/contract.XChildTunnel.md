# XChildTunnel
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/polygon/XChildTunnel.sol)

**Inherits:**
FxBaseChildTunnel, [Clone](/contracts/lib/Clone.sol/contract.Clone.md)


## State Variables
### DEPOSIT

```solidity
bytes32 public constant DEPOSIT = keccak256("DEPOSIT");
```


### MAP_TOKEN

```solidity
bytes32 public constant MAP_TOKEN = keccak256("MAP_TOKEN");
```


### SUFFIX_NAME

```solidity
string public constant SUFFIX_NAME = " (xERC677)";
```


### PREFIX_SYMBOL

```solidity
string public constant PREFIX_SYMBOL = "x";
```


### tokenTemplate

```solidity
address public immutable tokenTemplate;
```


### rootToChildToken

```solidity
mapping(address => address) public rootToChildToken;
```


## Functions
### constructor


```solidity
constructor(address _fxChild, address _tokenTemplate) FxBaseChildTunnel(_fxChild);
```

### withdraw


```solidity
function withdraw(address childToken, uint256 amount) public;
```

### withdrawTo


```solidity
function withdrawTo(address childToken, address receiver, uint256 amount) public;
```

### _processMessageFromRoot


```solidity
function _processMessageFromRoot(uint256, address sender, bytes memory data) internal override validateSender(sender);
```

### _mapToken


```solidity
function _mapToken(bytes memory syncData) internal;
```

### _syncDeposit


```solidity
function _syncDeposit(bytes memory syncData) internal;
```

### _withdraw


```solidity
function _withdraw(address childToken, address receiver, uint256 amount) internal;
```

### _isContract


```solidity
function _isContract(address _addr) private view returns (bool);
```

## Events
### TokenMapped

```solidity
event TokenMapped(address indexed rootToken, address indexed childToken);
```

### TokenDeposted

```solidity
event TokenDeposted(
    address indexed rootToken, address indexed depositor, address indexed user, uint256 amount, bytes data
);
```

