# Instructions

In order to deploy these contracts you have to put them at the same file or add the correct path to the contract that you need to import.
  
In this experiment, I create a Users contract to test whether Sender, CommunicatorSend, CommunicatorReceiver and Receiver are working or not. Therefore, you only need to delpoy the Users contract to do testing. I will demonstrate how to do it at Remix as following:

## 1. Deploy Users contract
![image](https://raw.githubusercontent.com/JianSShi/BIP2/master/pics/Deploy%20contract.png)
We will using the JavaScript as our environment because each execution runs only in your browser. Each time reloading the page will restart Remix with an empty state. And I set the default value as 50 ether. Then click the deploy button, you will noticed the contract is delpoyed and showing this:
![image](https://raw.githubusercontent.com/JianSShi/BIP2/master/pics/Deploy%20contract2.png)  

## 2.Create User
We need at least 2 users to simulate cross chain token transfer process. Thus, I create two user, A and B. Both of them set there default value as 500 wei. Then we call the Users function createUser to create user. We also need to assign each user a name(because users only knows who he will send to but not knowing the address)  
A's address : 0x580bfb95a4431def3afbb13bb2086d2fd94781b8  
B's address : 0xc6f7505b1d75642837b6b35759ab62e3c2886f25
![image](https://raw.githubusercontent.com/JianSShi/BIP2/master/pics/Create%20A.png)


## 3.Register User at the Reciever
Call the function registerRec.
![image](https://raw.githubusercontent.com/JianSShi/BIP2/master/pics/Create%20and%20register%20B.png)


## 4. Passing the balance from A to B
Call the function sendToB, and send 100 to B.
![image](https://raw.githubusercontent.com/JianSShi/BIP2/master/pics/A%20passing%20balance%20to%20B.png)  
After you click the transact button, we can exam our result by calling the getBalance funtion to test whether the balance of each user has been updated or not.
For A:  
![image](https://raw.githubusercontent.com/JianSShi/BIP2/master/pics/Get%20A's%20new%20balance.png)  
For B:
![image](https://raw.githubusercontent.com/JianSShi/BIP2/master/pics/Get%20B's%20new%20balance.png)  
Therefore, as we expect the A's balance has been deduct 100 become 400, and B's balance has corrspond changed to 600.


