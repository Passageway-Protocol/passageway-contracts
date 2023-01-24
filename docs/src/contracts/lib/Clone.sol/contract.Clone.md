# Clone
[Git Source](https://github.com/Passageway-Protocol/passageway-contracts/blob/b1d863b56b7778896c93bea0b98299fccb2c787f/contracts/lib/Clone.sol)


## Functions
### createClone


```solidity
function createClone(bytes32 _salt, address _target) internal returns (address _result);
```

### minimalProxyCreationCode


```solidity
function minimalProxyCreationCode(address logic) internal pure returns (bytes memory);
```

### computedCreate2Address


```solidity
function computedCreate2Address(bytes32 salt, bytes32 bytecodeHash, address deployer) public pure returns (address);
```

