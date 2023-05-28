const Web3 = require("web3");
const HDWalletProvider = require("@truffle/hdwallet-provider");

Web3.providers.HttpProvider.prototype.sendAsync = Web3.providers.HttpProvider.prototype.send

const provider = new Web3.providers.HttpProvider("https://devnet.neonevm.org");

// Private keys for test accounts
// NOTE: Replace these placeholders with your own and make sure the accounts have non-zero NEON balances


const privateKeys = ['']

module.exports = {

networks: {
    neonlabs: {
      provider: () => {
        return new HDWalletProvider(
          privateKeys,
          provider,
        );
      },
      network_id: "*"
    }
  },

  // Set default mocha options here, use special reporters, etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
        version: "0.8.4",
        settings: {
            optimizer: {
              enabled: true,
              runs: 1000   // Optimize for how many times you intend to run the code
            },

        }
  }
}
};
