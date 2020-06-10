pragma solidity 0.5.15;

import "../ERC20/ERC20.sol";
import "../Owner.sol";

contract TokenContract is ERC20 , Owner {

    constructor( string memory _name , string memory _symbol , string memory _desc )
        public
    {
        name = _name;
        symbol = _symbol;
        desc = _desc;
        decimals = 18;
        OwnerAddress = msg.sender;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function mint(address recipient, uint256 amount)
        isOwner
        public
        returns (bool result )
    {
        _mint( recipient , amount );
        result = true;
    }

    function transfer(address recipient, uint256 amount)
        public
        returns (bool result )
    {
        _transfer(msg.sender, recipient , amount );
        result = true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(_allowances[sender][msg.sender] >= amount, "ERC20: Not enough in deligation");
        _transfer(msg.sender, recipient , amount );
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
    }


    function allowance(address TokenOwner, address spender) public view returns (uint256) {
        return _allowances[TokenOwner][spender];
    }

    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
    }

}
