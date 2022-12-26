require("@nomicfoundation/hardhat-toolbox")
require("dotenv").config()
require("@nomicfoundation/hardhat-waffle")
require("@nomicfoundation/hardhat-etherscan")

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
    solidity: "0.8.17",
    networks: {
        mumbai: {
            url: process.env.TESTNET_URL_MUMBAI,
        },
        etherscan: {
            apiKey: process.env.POLYGONSCAN_API_KEY,
        },
    },
}
