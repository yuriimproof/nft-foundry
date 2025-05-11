// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 public s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToURI;

    constructor() ERC721("Dog", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory metadataURI) public returns (uint256) {
        s_tokenIdToURI[s_tokenCounter] = metadataURI;
        _mint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
        return s_tokenCounter - 1;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToURI[tokenId];
    }
}
