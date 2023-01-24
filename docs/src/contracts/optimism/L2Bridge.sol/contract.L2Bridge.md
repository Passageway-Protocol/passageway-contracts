# L2Bridge
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/optimism/L2Bridge.sol)

**Inherits:**
[IL2ERC721Bridge](/contracts/optimism/interfaces/IL2ERC721Bridge.sol/contract.IL2ERC721Bridge.md), CrossDomainEnabled, IERC721Receiver, [Clone](/contracts/lib/Clone.sol/contract.Clone.md)


## State Variables
### l1TokenBridge

```solidity
address public l1TokenBridge;
```


### tokenTemplate

```solidity
address public tokenTemplate;
```


### tokenMapping

```solidity
mapping(address => address) public tokenMapping;
```


## Functions
### constructor


```solidity
constructor(address _l2CrossDomainMessenger, address _l1TokenBridge, address _tokenTemplate)
    CrossDomainEnabled(_l2CrossDomainMessenger);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l2CrossDomainMessenger`|`address`|Cross-domain messenger used by this contract.|
|`_l1TokenBridge`|`address`|Address of the L1 bridge deployed to the main chain.|
|`_tokenTemplate`|`address`||


### withdraw

*initiate a withdraw of some tokens to the caller's account on L1*


```solidity
function withdraw(address _l2Token, uint256 _tokenId, uint32 _l1Gas, bytes calldata _data) external virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l2Token`|`address`|Address of L2 token where withdrawal was initiated.|
|`_tokenId`|`uint256`|Token ID to withdraw.|
|`_l1Gas`|`uint32`|Unused, but included for potential forward compatibility considerations.|
|`_data`|`bytes`|Optional data to forward to L1. This data is provided solely as a convenience for external contracts. Aside from enforcing a maximum length, these contracts provide no guarantees about its content.|


### withdrawTo

*initiate a withdraw of some token to a recipient's account on L1.*


```solidity
function withdrawTo(address _l2Token, address _to, uint256 _tokenId, uint32 _l1Gas, bytes calldata _data)
    external
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l2Token`|`address`|Address of L2 token where withdrawal is initiated.|
|`_to`|`address`|L1 adress to credit the withdrawal to.|
|`_tokenId`|`uint256`|Token ID to withdraw.|
|`_l1Gas`|`uint32`|Unused, but included for potential forward compatibility considerations.|
|`_data`|`bytes`|Optional data to forward to L1. This data is provided solely as a convenience for external contracts. Aside from enforcing a maximum length, these contracts provide no guarantees about its content.|


### _initiateWithdrawal

*Performs the logic for withdrawals by burning the token and informing
the L1 token Gateway of the withdrawal.*


```solidity
function _initiateWithdrawal(
    address _l2Token,
    address _from,
    address _to,
    uint256 _tokenId,
    uint32 _l1Gas,
    bytes calldata _data
) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l2Token`|`address`|Address of L2 token where withdrawal is initiated.|
|`_from`|`address`|Account to pull the withdrawal from on L2.|
|`_to`|`address`|Account to give the withdrawal to on L1.|
|`_tokenId`|`uint256`|Token ID to withdraw.|
|`_l1Gas`|`uint32`|Gas limit for the L1 transaction.|
|`_data`|`bytes`|Optional data to forward to L1.|


### finalizeDeposit

*Complete a deposit from L1 to L2, and credits funds to the recipient's balance of this
L2 token. This call will fail if it did not originate from a corresponding deposit in
L1StandardTokenBridge.*


```solidity
function finalizeDeposit(address _l1Token, address _from, address _to, uint256 _tokenId, bytes calldata _data)
    external
    virtual
    onlyFromCrossDomainAccount(l1TokenBridge);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l1Token`|`address`|Address for the l1 token this is called with|
|`_from`|`address`|Account to pull the deposit from on L2.|
|`_to`|`address`|Address to receive the withdrawal at|
|`_tokenId`|`uint256`|Token ID to withdraw|
|`_data`|`bytes`|Data provider by the sender on L1. This data is provided solely as a convenience for external contracts. Aside from enforcing a maximum length, these contracts provide no guarantees about its content.|


### _finalizeDeposit


```solidity
function _finalizeDeposit(address _l1Token, address _from, address _to, uint256 _tokenId, bytes calldata _data)
    external
    virtual;
```

### onERC721Received


```solidity
function onERC721Received(address, address, uint256, bytes calldata) external pure override returns (bytes4);
```

