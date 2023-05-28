var MyContract = artifacts.require("NameService");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(MyContract);
};