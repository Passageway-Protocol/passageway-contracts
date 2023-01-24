# XERC677
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/polygon/tokens/XERC677.sol)

**Inherits:**
[ERC677](/contracts/polygon/tokens/ERC677_Template.sol/contract.ERC677.md)


## State Variables
### xManager

```solidity
address internal xManager;
```


### _connectedToken

```solidity
address internal _connectedToken;
```


## Functions
### initialize


```solidity
function initialize(address manager, address connectedToken_, string memory name, string memory symbol, uint8 decimals)
    public;
```

### fxManager


```solidity
function fxManager() public view returns (address);
```

### connectedToken


```solidity
function connectedToken() public view returns (address);
```

### setupMetaData


```solidity
function setupMetaData(string memory _name, string memory _symbol, uint8 _decimals) public;
```

### mint


```solidity
function mint(address user, uint256 amount) public;
```

### burn


```solidity
function burn(address user, uint256 amount) public;
```

