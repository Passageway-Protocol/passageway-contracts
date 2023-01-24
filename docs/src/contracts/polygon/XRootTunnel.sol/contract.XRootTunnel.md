# XRootTunnel
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/polygon/XRootTunnel.sol)

**Inherits:**
FxBaseRootTunnel, [Clone](/contracts/lib/Clone.sol/contract.Clone.md)


## State Variables
### DEPOSIT

```solidity
bytes32 public constant DEPOSIT = keccak256("DEPOSIT");
```


### MAP_TOKEN

```solidity
bytes32 public constant MAP_TOKEN = keccak256("MAP_TOKEN");
```


### rootToChildTokens

```solidity
mapping(address => address) public rootToChildTokens;
```


### childTokenTemplateCodeHash

```solidity
bytes32 public immutable childTokenTemplateCodeHash;
```


## Functions
### constructor


```solidity
constructor(address _checkpointManager, address _fxRoot, address _fxERC20Token)
    FxBaseRootTunnel(_checkpointManager, _fxRoot);
```

### mapToken


```solidity
function mapToken(address rootToken) public;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rootToken`|`address`|address of token on root chain|


### deposit


```solidity
function deposit(address rootToken, address user, uint256 amount, bytes memory data) public;
```

### _processMessageFromChild


```solidity
function _processMessageFromChild(bytes memory data) internal override;
```

## Events
### TokenMappedERC20

```solidity
event TokenMappedERC20(address indexed rootToken, address indexed childToken, bytes message);
```

### FxWithdrawERC20

```solidity
event FxWithdrawERC20(
    address indexed rootToken, address indexed childToken, address indexed userAddress, uint256 amount
);
```

### FxDepositERC20

```solidity
event FxDepositERC20(
    address indexed rootToken, address indexed depositor, address indexed userAddress, uint256 amount, bytes message
);
```

