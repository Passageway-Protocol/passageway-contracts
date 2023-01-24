# IL2StandardERC721
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/optimism/interfaces/IL2StandardERC721.sol)

**Inherits:**
IERC721


## Functions
### l1Token


```solidity
function l1Token() external returns (address);
```

### mint


```solidity
function mint(address _to, uint256 _tokenId, string memory _tokenURI) external;
```

### burn


```solidity
function burn(address _from, uint256 _tokenId) external;
```

### initialize


```solidity
function initialize(address manager, address l1Token, string memory _name, string memory _symbol) external;
```

## Events
### Mint

```solidity
event Mint(address indexed _account, uint256 _tokenId);
```

### Burn

```solidity
event Burn(address indexed _account, uint256 _tokenId);
```

