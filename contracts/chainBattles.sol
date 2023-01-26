// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// imports

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol"; // for adding some token Ids
import "@openzeppelin/contracts/utils/Strings.sol"; // converting int to str
import "@openzeppelin/contracts/utils/Base64.sol"; // work with our SVGs

contract ChianBattles is ERC721URIStorage {
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

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

        return string(abi.encodePacked("data:image/svg+xml;base64,", Base64.encode(svg)));
    }

    function getLevels(uint256 tokenId) public view returns (string memory) {
        uint256 levels = tokenIdtoLevels[tokenId];
        return levels.toString();
    }

    function getTokenURI(uint256 tokenId) public returns (string memory) {
        bytes memory dataURI = abi.encodePacked(
            "{",
            '"name": "Chain Battles #',
            tokenId.toString(),
            '",',
            '"description": "Battles on chain with alireza",',
            '"image": "',
            generateCharacter(tokenId),
            '"',
            "}"
        );

        return string(abi.encodePacked("data:application/json;base64,", Base64.encode(dataURI)));
    }

    function mint() public {
        _tokenIds.increment(); // because the original number of count is zero
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        tokenIdtoLevels[newItemId] = 0; // start with the level of the zero
        _setTokenURI(newItemId, getTokenURI(newItemId));
    }

    function train() {
        require(_exists(tokenId), "please use an existing Token");
        require(ownerOf(tokenId) == msg.sender, "You must own this token to train it.");

        // after this requires we're going to continue our code.

        uint256 currentLevel = tokenIdtoLevels[tokenId]; // get the current value of tokenId
        tokneIdtoLevels[tokenId] = currentWins + 1; // increase the tokenId level
        _setTokenURI(tokenId, getTokenURI(tokenId));
    }
}
