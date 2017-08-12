pragma solidity ^0.4.2;

import "./MortalContract.sol";

contract SendAndReceive is MortalContract{
  address public owner;
  mapping (address => uint256) private contributedEth;
  uint256 public eth = 0;

  function SendAndReceive(){
    owner = msg.sender;
  }

  function sendToContract() {
    require(msg.value > 0);
    eth += msg.value;
    contributedEth[msg.sender] = contributedEth[msg.sender] + msg.value;
  }

  function howMuchDidIGaveyYou(address _account) returns (uint) {
    return contributedEth[_account];
  }

  function receive(uint256 _value) justOwner{
    require(_value <= this.balance);
    owner.transfer(_value);
  }

  function utterMistake(uint256 _value) {
    require(_value <= this.balance);
    msg.sender.transfer(_value);
  }
}
