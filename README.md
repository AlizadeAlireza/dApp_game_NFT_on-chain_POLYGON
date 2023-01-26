# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

### why we use SVG

we can display base64 images in the browser without the need for a hosting provider.

Copying and pasting the svg code and data: in your browser URL bar will display the same image.

and it's not a common URL:

    - Data directives
    - The Base64 data - contains the actual data

This is useful because, even if Solidity is not able to handle images, it is able to handle strings and SVGs aren't anything else than sequences of tags and strings we can easily retrieve runtime, plus, converting everything to base64, will allow us to store our images on-chain without the need of object storage.

## functions

-   generateCharacter():

    for get the SVG file to it and get token id to levelup.

-   getTokenURI():

    for get token uri from IPFS.

-   mint():

    it's for anybody to mint this NFT

    sor first we increment this because the first number of the count is zero.
    after we get the current value of our tokenID and call \_safeMint function.

    we set tokenIdtoLevels increment equal to zero because we must start with level of zero.

    at the end we call the \_setTokenURI and pass it newItemId and tokenURI that is our getTokenURI function.

### most important function

-   train():

    this function take the tokenId and going to change the nft that we interacting with.

    1. we're going to check if the tokenId being supplied exists.
    2. require the ownerOf.

    after this conditions we get the current level of our token and increase it.
    so we must set the new tokenURI with an existing itemId.
