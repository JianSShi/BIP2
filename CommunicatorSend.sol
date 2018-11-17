pragma solidity ^0.4.22;

import "./CommunicatorReceiver.sol";
import "./Sender.sol";
contract CommunicatorSend{
    //managedContracts map store Sender's address and balance
    mapping(address => uint) managedContracts;
    CommunicatorReceiver commR;

    constructor(CommunicatorReceiver cReceiver) public payable {
        commR = cReceiver;
    }

    //Call the CommunicatorReceiver to pass the balance to the Receiver
    function requestSend(address addr, string b, uint balance, address senderAd) payable public{
       // increase balance to the Sender, Sender pass the balance to the receiver
        managedContracts[addr] = managedContracts[addr] + balance; 
        // When the CommunicatorReceiver successfuly send the balance to the receiver
        // call the onSend function to return message
        if(commR.requestReceive(b, balance)){
            onSend(balance, addr, true, senderAd);
            balance = 0;
        }
    }

    // Send message to the Sender contract if transaction successed
    function onSend(uint balance, address addr, bool isSuccess, address senderAd) payable public{
        if(isSuccess){
          managedContracts[addr] = managedContracts[addr] - balance;
          Sender se = Sender(addr);
          se.onSends(balance,true,senderAd);
        }
    }
    
    //Regist the sender contract to the CommunicatorSend
    function registerAddress(address addr, uint balance) payable public{
        managedContracts[addr] = balance;
    }
}
