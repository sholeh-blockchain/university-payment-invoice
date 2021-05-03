//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./idrtToken.sol";

contract Invoice is Ownable, idrtToken{
    string public nim;
    string  name;
    uint public invoiceAmount;
    uint public dueDate;
    uint public typePayment; //teype pembayaran, spp atau her regis
    address  owner;
    
   //mapping(address => uint) balances;
    
    
    constructor(uint _invoiceAmount, string memory _nim, string memory _name) {
        dueDate = block.timestamp +  200 ;
        invoiceAmount = _invoiceAmount;
        nim = _nim;
        name = _name;
        owner = msg.sender;
    } 
    
    // function addInvoice (address receiver, uint invoiceAmount) public {
    //     require(msg.sender == owner);
    //     require(invoiceAmount < 1e60);
    //     balances[receiver] += invoiceAmount;
    // }
    fallback () payable external {
        require(
            msg.value==invoiceAmount, "payment invoice amount");
    }
    
    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdraw() public {
        require(
            msg.sender == owner, "only widraw payment");
        require(
            block.timestamp > dueDate, "due data not been reached");
        payable(msg.sender).transfer(address(this).balance);
    }
        
    // function setPrice(uint _invoiceAmount) public{
    //     invoiceAmount = _invoiceAmount;
    // }
    
    
    
    
    
}
