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
