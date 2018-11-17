pragma solidity ^0.4.22;

import "./CommunicatorSend.sol";
import "./CommunicatorReceiver.sol";
import "./Sender.sol";
import "./Receiver.sol";

contract Users{

    // records and receiverRecords to store the user's address, string and balance
    mapping(address => uint) records;
    mapping(string => address) receiverRecords;
    
    address cBddr = 0x72bA7d8E73Fe8EB666eA66babC8116A41bfb10e3;
    CommunicatorReceiver commR = new CommunicatorReceiver(cBddr);
    CommunicatorSend cSender = new CommunicatorSend(commR);

    constructor() public payable{
    }

    Sender sender = new Sender(cSender);
    Receiver receiver = new Receiver(commR);

    // Creating user and store them at the map
    function createUser(string name) payable public {
        records[msg.sender] = msg.value;
        receiverRecords[name] = msg.sender;
    }

    // Send balance to the receiver user
    function sendToB(address addr, uint balance, string recName) payable public{
        uint t = records[addr];
        // whether the sender user has enough balance
        require(t >= balance);
        
        //register the sender user to the sender contract
        sender.register(addr, t);
        sender.comToSend(recName, balance, addr);
        
        //update balance after transaction
        uint balAfter = sender.getBalance(addr); // sender user's new balance is getting from the what is store at the sender contract
        address reciverAd = receiverRecords[recName]; // receiver user's new balance is geting from the reciver contract
        records[addr] = balAfter;
        records[reciverAd] = receiver.getBalance(recName);
    }

    // Register the user to the Reciver contract
    function registerRec(address addr, string recName) payable public{
        receiver.register(addr, recName, records[addr]);
    }

    // Testing wheter the user's balance has been update
    function getBalance(address addr) public view returns(uint){
        return records[addr];
    }
    
}
