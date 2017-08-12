pragma solidity ^0.4.2;

contract MortalContract {
  address public owner;

  function MortalContract(){
    owner = msg.sender;
  }

  modifier justOwner {
    require(msg.sender == owner);
    _;
  }

  function kill() justOwner{
    suicide(owner);
  }
}

contract SendAndReceive is MortalContract{
  address public owner;
  mapping (address => uint256) private contributedEth;
  uint256 public eth = 0;

  function SendAndReceive(){
    owner = msg.sender;
  }

  function sum(uint a, uint b) returns (uint){
    return a + b;
  }

  function sendToContract() payable {
    require(msg.value > 0);
    eth += msg.value;
    contributedEth[msg.sender] = contributedEth[msg.sender] + msg.value;
  }

  function howMuchDidIGaveyYou() returns (uint) {
    return contributedEth[msg.sender];
  }

  function receive(uint _value) justOwner{
    require(_value <= this.balance);
    owner.transfer(_value * 1000000000000000000);
    contributedEth[owner] = contributedEth[owner] - msg.value;
  }

  function utterMistake(uint256 _value) {
    require(_value <= this.balance);
    msg.sender.transfer(_value * 1000000000000000000);
  }
}
