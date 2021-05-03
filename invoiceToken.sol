//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "./idrtToken.sol";

contract Invoice is OOwnable, idrtToken {
    string public nim;
    string public name;
    uint public invoiceAmount;
    uint public dueDate;
    uint public typePayment; //teype pembayaran, spp atau her regis
    address public owner;
    
    mapping(address => uint) balances;
    
    
    constructor(uint _invoiceAmount, string memory _nim, string memory _name) {
        dueDate = block.timestamp +  200 ;
        invoiceAmount = _invoiceAmount;
        nim = _nim;
        name = _name;
        owner = msg.sender;
    } 
    
    
    // event invoiceEvent(address from, uint amount);
    
    // modifier minAmount(amount) {
    //     rerequire(msg.value >= invoiceAmount);
    //}
    
    fallback () payable external {
        require(msg.value == invoiceAmount, "payment invoice amount");
    }
    
    function transfer() public payable {
        balances[msg.sender] = msg.value;
    }
    
    function transferIdrt() public payable
        balances[msg.sender].invoiceAmount += msg.value;
        
    }
    
    function getBalance() public view returns(uint balbalance) {
        return balances[msg.sender];
    }
//   function addInvoice(address received, uint amount) public {
//       re
//   }
    
    // function getContratBalance() public view returns (uint) {
    //     return address(this).balance;
    // }
    
    function withdraw() public {
        require(msg.sender ==owner, "only withdraw payment");
        require(block.timestamp > dueDate, "due date reached");
       payable(msg.sender).transfer(address(this).balance);
    }
    
   // function addInvoice()
   
    
    //function widraw 
    
    
    
    
}
