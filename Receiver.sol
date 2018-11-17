pragma solidity ^0.4.22;

import "./CommunicatorReceiver.sol";

contract Receiver{
    CommunicatorReceiver cb;

    constructor(CommunicatorReceiver commR) public payable {
        cb = commR;
    }
    
    //Store user's info
    mapping(string => address) receiverRecords;
    mapping(string => uint) reRecords;

    // put user's info to the map
    function register(address addr, string b, uint balance) payable public{
        receiverRecords[b] = addr;
        reRecords[b] = balance;
        cb.registerAddress(addr,b,balance,address(this));
    }
    
    function getBalance(string b) payable public returns(uint){
        return reRecords[b];
    }
    
    //update user's new balance after recive from CommunicatorReceiver
    function updateBalance(string b, uint balance) payable public{
        reRecords[b] = balance;
    }

}
