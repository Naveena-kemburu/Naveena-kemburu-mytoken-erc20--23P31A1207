// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Token metadata
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Mapping to track balances: address => balance
    mapping(address => uint256) public balanceOf;

    // Nested mapping for allowances: owner => (spender => amount)
    mapping(address => mapping(address => uint256)) public allowance;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // Constructor to initialize total supply and assign to creator
    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    // Function to transfer tokens from caller to another address
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Validate that recipient is not zero address
        require(_to != address(0), "Cannot transfer to zero address");

        // Validate sender has sufficient balance
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Subtract from sender's balance
        balanceOf[msg.sender] -= _value;
        // Add to recipient's balance
        balanceOf[_to] += _value;

        // Emit Transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    // Function to approve another address to spend tokens on your behalf
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // Validate spender is not zero address
        require(_spender != address(0), "Cannot approve zero address");

        // Set allowance for spender
        allowance[msg.sender][_spender] = _value;

        // Emit Approval event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    // Function to transfer tokens from one address to another using allowance
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Validate recipient is not zero address
        require(_to != address(0), "Cannot transfer to zero address");

        // Validate sender has sufficient balance
        require(balanceOf[_from] >= _value, "Insufficient balance");

        // Validate caller has sufficient allowance
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Subtract from owner's balance
        balanceOf[_from] -= _value;
        // Add to recipient's balance
        balanceOf[_to] += _value;
        // Decrease allowance
        allowance[_from][msg.sender] -= _value;

        // Emit Transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }
}
