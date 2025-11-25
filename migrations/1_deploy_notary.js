// Get the "blueprint" (artifact) of the contract
const Notary = artifacts.require("Notary");

// This is the function that Truffle will run
module.exports = function (deployer) {
  // "Deployer" is the Truffle tool that handles deployment
  // This line tells it to deploy our Notary contract
  deployer.deploy(Notary);
};