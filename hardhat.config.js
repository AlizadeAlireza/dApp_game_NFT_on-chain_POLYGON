require("@nomicfoundation/hardhat-toolbox")
require("dotenv").config()
require("@nomicfoundation/hardhat-waffle")
require("@nomicfoundation/hardhat-etherscan")

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
    solidity: {
        version: "0.8.17",
        version: "0.8.0",
    },
    networks: {
        mumbai: {
            url: process.env.TESTNET_URL_MUMBAI,
            accounts: [process.env.PRIVATE_KEY],
        },
        etherscan: {
            apiKey: process.env.POLYGONSCAN_API_KEY,
        },
    },
}
