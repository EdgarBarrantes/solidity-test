var MortalContract = artifacts.require("./MortalContract.sol");
var SendAndReceive = artifacts.require("./SendAndReceive.sol");

module.exports = function(deployer) {
  deployer.deploy(MortalContract);
  deployer.link(MortalContract, SendAndReceive);
  deployer.deploy(SendAndReceive);
};
