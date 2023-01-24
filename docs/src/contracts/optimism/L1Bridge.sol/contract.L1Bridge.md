# L1Bridge
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/optimism/L1Bridge.sol)

**Inherits:**
[IL1ERC721Bridge](/contracts/optimism/interfaces/IL1ERC721Bridge.sol/contract.IL1ERC721Bridge.md), CrossDomainEnabled, IERC721Receiver, [Clone](/contracts/lib/Clone.sol/contract.Clone.md)


## State Variables
### l2TokenBridge

```solidity
address public l2TokenBridge;
```


### owner

```solidity
address owner;
```


### tokenMapping

```solidity
mapping(address => address) public tokenMapping;
```


### templateCodeHash

```solidity
bytes32 public templateCodeHash;
```


## Functions
### constructor


```solidity
constructor() CrossDomainEnabled(address(0));
```

### initialize


```solidity
function initialize(address _l1messenger, address _l2TokenBridge, address template) public;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l1messenger`|`address`|L1 Messenger address being used for cross-chain communications.|
|`_l2TokenBridge`|`address`|L2 standard bridge address.|
|`template`|`address`||


### onlyEOA


```solidity
modifier onlyEOA();
```

### depositERC721


```solidity
function depositERC721(address _l1Token, uint256 _tokenId, uint32 _l2Gas, bytes calldata _data)
    external
    virtual
    onlyEOA;
```

### depositERC721To


```solidity
function depositERC721To(address _l1Token, address _to, uint256 _tokenId, uint32 _l2Gas, bytes calldata _data)
    external
    virtual;
```

### _initiateERC721Deposit

*Performs the logic for deposits by informing the L2 Deposited Token
contract of the deposit and calling a handler to lock the L1 funds.*


```solidity
function _initiateERC721Deposit(
    address _l1Token,
    address _from,
    address _to,
    uint256 _tokenId,
    uint32 _l2Gas,
    bytes calldata
) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l1Token`|`address`|Address of the L1 ERC721 we are depositing|
|`_from`|`address`|Account to pull the deposit from on L1|
|`_to`|`address`|Account to give the deposit to on L2|
|`_tokenId`|`uint256`|Amount of the ERC721 to deposit.|
|`_l2Gas`|`uint32`|Gas limit required to complete the deposit on L2.|
|`<none>`|`bytes`||


### finalizeERC721Withdrawal


```solidity
function finalizeERC721Withdrawal(
    address _l1Token,
    address _l2Token,
    address _from,
    address _to,
    uint256 _tokenId,
    bytes calldata _data
) external onlyFromCrossDomainAccount(l2TokenBridge);
```

### _checkMapping


```solidity
function _checkMapping(address token) internal view returns (bool);
```

### onERC721Received


```solidity
function onERC721Received(address, address, uint256, bytes calldata) external pure override returns (bytes4);
```

