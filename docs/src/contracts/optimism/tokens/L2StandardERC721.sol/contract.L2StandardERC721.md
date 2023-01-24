# L2StandardERC721
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/optimism/tokens/L2StandardERC721.sol)

**Inherits:**
[IL2StandardERC721](/contracts/optimism/interfaces/IL2StandardERC721.sol/contract.IL2StandardERC721.md), [ERC721_Template](/contracts/optimism/tokens/ERC721_Template.sol/contract.ERC721_Template.md)


## State Variables
### l1Token

```solidity
address public l1Token;
```


### l2Bridge

```solidity
address public l2Bridge;
```


### baseURI

```solidity
string public baseURI;
```


### _tokenURIs

```solidity
mapping(uint256 => string) private _tokenURIs;
```


## Functions
### initialize


```solidity
function initialize(address manager, address connectedToken_, string memory name, string memory symbol) public;
```

### onlyL2Bridge


```solidity
modifier onlyL2Bridge();
```

### mint


```solidity
function mint(address to, uint256 tokenId, string memory _tokenURI) public virtual onlyL2Bridge;
```

### burn


```solidity
function burn(address _from, uint256 _tokenId) public virtual onlyL2Bridge;
```

### setupMetaData


```solidity
function setupMetaData(string memory _name, string memory _symbol) public;
```

### _baseURI


```solidity
function _baseURI() internal view override returns (string memory);
```

### _setTokenURI


```solidity
function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual;
```

### tokenURI


```solidity
function tokenURI(uint256 tokenId) public view virtual override returns (string memory);
```

