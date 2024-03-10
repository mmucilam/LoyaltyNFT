const LoyaltyNFT = artifacts.require("LoyaltyNFT");

module.exports = function (deployer) {
  deployer.deploy(LoyaltyNFT);
};
