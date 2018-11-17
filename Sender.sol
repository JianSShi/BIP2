pragma solidity ^0.4.22;

import "./CommunicatorSend.sol";
contract Sender{
    // record map is store the user who is sending balance to other user 
    mapping(address => uint) record;
    CommunicatorSend comSend;

    // register the sender to the CommunicatorSend and set the original amount
    constructor(CommunicatorSend cSender) public payable {
        uint amounts = 100000000;
        cSender.registerAddress(address(this), amounts);
        comSend = cSender;
    }

    // Sender calling the CommunicatorSend's function to pass the balance to the CommunicatorSend
    function comToSend(string name, uint balance, address senderAd) payable public{
        comSend.requestSend(address(this), name, balance, senderAd);
    }
    
    // If the transaction success, update the user balance
    function onSends(uint balance, bool isSuccess, address senderAd) public{
        if(isSuccess){
            record[senderAd] = record[senderAd] - balance;
        }
    }
    
    //Get function to get the user's new balance
    function getBalance(address addr) public view returns(uint){
        return record[addr];
    }
    
     // register the user to the Sender contract
    function register(address a, uint balance) public{
        record[a] = balance;
    }

}
