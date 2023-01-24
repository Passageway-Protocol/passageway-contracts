# ERC677_Token
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/polygon/tokens/base/ERC677.sol)

**Inherits:**
ERC20


## Functions
### constructor


```solidity
constructor(string memory _tokenName, string memory _tokenSymbol, uint256 _totalSupply)
    ERC20(_tokenName, _tokenSymbol);
```

### transferAndCall


```solidity
function transferAndCall(address _to, uint256 _value, bytes memory _data) public returns (bool);
```

### transferAndCallFrom


```solidity
function transferAndCallFrom(address _sender, address _to, uint256 _value, bytes memory _data)
    internal
    returns (bool);
```

### contractFallback


```solidity
function contractFallback(address _sender, address _to, uint256 _value, bytes memory _data) internal;
```

### isContract


```solidity
function isContract(address _addr) internal view returns (bool hasCode);
```

