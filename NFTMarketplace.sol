
---

### **Example Solidity Contract (`contracts/NFTMarketplace.sol`)**  
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMarketplace is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;
    mapping(uint256 => uint256) public price;
    mapping(uint256 => bool) public listedForSale;

    constructor() ERC721("NFT Marketplace", "NFTM") {}

    function mintNFT(string memory tokenURI, uint256 _price) public returns (uint256) {
        _tokenIds++;
        uint256 newItemId = _tokenIds;

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        price[newItemId] = _price;
        listedForSale[newItemId] = true;

        return newItemId;
    }

    function buyNFT(uint256 tokenId) public payable {
        require(listedForSale[tokenId], "NFT not for sale");
        require(msg.value >= price[tokenId], "Insufficient funds");

        address seller = ownerOf(tokenId);
        payable(seller).transfer(msg.value);

        _transfer(seller, msg.sender, tokenId);
        listedForSale[tokenId] = false;
    }

    function listNFT(uint256 tokenId, uint256 _price) public {
        require(ownerOf(tokenId) == msg.sender, "Not the owner");
        price[tokenId] = _price;
        listedForSale[tokenId] = true;
    }
}
