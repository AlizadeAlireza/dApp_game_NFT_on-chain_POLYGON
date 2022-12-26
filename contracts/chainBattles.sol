// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// imports

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol"; // for adding some token Ids
import "@openzeppelin/contracts/utils/Strings.sol"; // converting int to str
import "@openzeppelin/contracts/utils/Base64.sol"; // work with our SVGs

contract ChianBattles is ERC721URIStorage {
    using strings for uint256;
    using Counters for Counters.Counter;
    Counter.Counter private _tokenIds;

    // keeping track of the levels for each of our NFT's.
    mapping(uint256 => uint256) public tokenIdtoLevels;

    constructor() ERC721("Chain Battles", "CBTLS") {}

    function generateCharacter(uint256 tokenId) public returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            "<style>.base { fill: white; font-family: serif; font-size: 14px; }</style>",
            '<rect width="100%" height="100%" fill="black" />',
            '<text x="50%" y="40%" class="base" dominant-baseline="middle" text-anchor="middle">Warrior</text>',
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">Levels: getLevels(tokenId)</text>',
            "</svg>"
        );
    }
}
