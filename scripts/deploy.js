const main = async () => {
    try {
        const nftContractFactory = await hre.ethers.getContractFactory("ChainBattles")
        const nftContract = await nftContractFactory.deploy()
    } catch (error) {}
}
