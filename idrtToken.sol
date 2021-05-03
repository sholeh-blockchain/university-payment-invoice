//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract idrtToken is ERC20{
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    constructor() ERC20("rupiahToken","IDRT") {
        _mint (msg.sender, 1000 * 10 ** decimals() ); 
    }
}
