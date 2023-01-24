# IL1ERC721Bridge
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/optimism/interfaces/IL1ERC721Bridge.sol)


## Functions
### l2TokenBridge

*get the address of the corresponding L2 bridge contract.*


```solidity
function l2TokenBridge() external returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|Address of the corresponding L2 bridge contract.|


### depositERC721

*deposit an amount of the ERC721 to the caller's balance on L2.*


```solidity
function depositERC721(address _l1Token, uint256 _tokenId, uint32 _l2Gas, bytes calldata _data) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l1Token`|`address`|Address of the L1 ERC721 we are depositing|
|`_tokenId`|`uint256`|Amount of the ERC721 to deposit|
|`_l2Gas`|`uint32`|Gas limit required to complete the deposit on L2.|
|`_data`|`bytes`|Optional data to forward to L2. This data is provided solely as a convenience for external contracts. Aside from enforcing a maximum length, these contracts provide no guarantees about its content.|


### depositERC721To

*deposit an amount of ERC721 to a recipient's balance on L2.*


```solidity
function depositERC721To(address _l1Token, address _to, uint256 _tokenId, uint32 _l2Gas, bytes calldata _data)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l1Token`|`address`|Address of the L1 ERC721 we are depositing|
|`_to`|`address`|L2 address to credit the withdrawal to.|
|`_tokenId`|`uint256`|Amount of the ERC721 to deposit.|
|`_l2Gas`|`uint32`|Gas limit required to complete the deposit on L2.|
|`_data`|`bytes`|Optional data to forward to L2.|


### finalizeERC721Withdrawal

*Complete a withdrawal from L2 to L1, and credit funds to the recipient's balance of the
L1 ERC721 token.*


```solidity
function finalizeERC721Withdrawal(
    address _l1Token,
    address _l2Token,
    address _from,
    address _to,
    uint256 _tokenId,
    bytes calldata _data
) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_l1Token`|`address`|Address of L1 token to finalizeWithdrawal for.|
|`_l2Token`|`address`|Address of L2 token where withdrawal was initiated.|
|`_from`|`address`|L2 address initiating the transfer.|
|`_to`|`address`|L1 address to credit the withdrawal to.|
|`_tokenId`|`uint256`|Amount of the ERC721 to deposit.|
|`_data`|`bytes`|Data provided by the sender on L2.|


## Events
### ERC721DepositInitiated

```solidity
event ERC721DepositInitiated(
    address indexed _l1Token, address indexed _from, address _to, uint256 _tokenId, bytes _data
);
```

### ERC721WithdrawalFinalized

```solidity
event ERC721WithdrawalFinalized(
    address indexed _l1Token,
    address indexed _l2Token,
    address indexed _from,
    address _to,
    uint256 _tokenId,
    bytes _data
);
```

