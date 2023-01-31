pragma solidity ^0.5.0;

contract MyToken {
    // Name
    string public name =  "Faisal Token";

    // Symbol
    string public symbol =  "DAPP";

    // Standard
    string public standard = "DApp Token v1.0";
    // Set the total number of tokens
    // Read the total number of tokens
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(
        address indexed _from, 
        address indexed _to, 
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    // Constructor
    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        // Allocate the initial supply
    }

    // Transfer 
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Exception if account does not have enough Ether
        require(balanceOf[msg.sender] >= _value);
        // Transfer the balance
         balanceOf[msg.sender] -= _value;
         balanceOf[_to] += _value;
        // Return a Boolean
        // Transfer Event
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Deletegated Transfer
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Require _from has enough tokens
        require(_value <= balanceOf[_from]);
        // Require allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        // Change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        // Update the allowance
        allowance[_from][msg.sender] -= _value;
        // Transfer Event
        emit Transfer(_from, _to, _value);
        // return a Boolean
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // allowance
        allowance[msg.sender][_spender] = _value;
        // Approve Event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }
    
    // function allowance(address _owner, address _spender) public returns (uint256 remaining) {
        
    // }
}

