# IxERC677
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/polygon/interfaces/IxERC677.sol)

**Inherits:**
[IERC677](/contracts/polygon/interfaces/IERC677.sol/contract.IERC677.md)


## Functions
### fxManager


```solidity
function fxManager() external returns (address);
```

### connectedToken


```solidity
function connectedToken() external returns (address);
```

### initialize


```solidity
function initialize(
    address _fxManager,
    address _connectedToken,
    string memory _name,
    string memory _symbol,
    uint8 _decimals
) external;
```

### mint


```solidity
function mint(address user, uint256 amount) external;
```

### burn


```solidity
function burn(address user, uint256 amount) external;
```

