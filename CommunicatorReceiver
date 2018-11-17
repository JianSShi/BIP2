pragma solidity ^0.4.22;

import "./Receiver.sol";

contract CommunicatorReceiver{
    struct User{
        address addr;
        string name;
        uint amount;
    }
    // Reciver contract's address
    address public rr;
    
    mapping(string => User) contracts;
    address public comaddress;
   
    constructor(address input) public payable {
         comaddress = input;
    }

    // CommunicatorReceiver pass the balance to the Receiver
   function requestReceive(string b, uint balance) payable public returns(bool){
        // update reciever's balance
        contracts[b].amount = contracts[b].amount + balance;
        uint test = contracts[b].amount;
       // bytes4 methodId = bytes4(keccak256("onSend(uint256,address,bool,address)"));
        //if(comSender.call(methodId,balance, a, true, input)){
        Receiver re = Receiver(rr);
        re.updateBalance(b, test);
        return true;
    }
    
    //Registe reciever to the CommunicatorReceiver
    function registerAddress(address a, string reciver, uint balance, address recieverAd) public{
        User memory user = User(a, reciver, balance);
        contracts[reciver] = user;
        rr = recieverAd;
    }
    
}
