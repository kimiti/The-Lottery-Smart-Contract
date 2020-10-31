var Lottery = artifacts.require("lottery-solidity");

module.exports = function (deployer) {
  deployer.deploy(Lottery);
};
