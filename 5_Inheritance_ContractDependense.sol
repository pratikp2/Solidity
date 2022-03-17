// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

//Inheritance

contract Ownable {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }
}

contract SecretValut {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }
}

contract SecretManager is Ownable {
    address secretValut;

    constructor(string memory _secret) {
        SecretValut _secretVault = new SecretValut(_secret);
        secretValut = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        SecretValut _secretVault = SecretValut(secretValut);
        return _secretVault.getSecret();
    }
}
