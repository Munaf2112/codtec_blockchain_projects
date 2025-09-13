// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenTransfer {
    string public name = "SimpleToken";   // Token name
    string public symbol = "STK";         // Token symbol
    uint8 public decimals = 18;           // Standard decimals
    uint256 public totalSupply;           // Total token supply

    mapping(address => uint256) public balanceOf;

    // Event to log transfers
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Constructor: give all tokens to deployer
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
    }

    // Transfer function
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
