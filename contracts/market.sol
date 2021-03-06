// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract StoreListings is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("StoreListing", "ITM") {}

    mapping(address => uint256) public tips;
    mapping(uint256 => uint256) public prices;
    function createListing(string memory tokenURI, uint256 price) public
returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        prices[newItemId] = price;
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function buy(uint256 tokenId) payable public{
             uint256 tokenprice = prices[tokenId];
             require(msg.value == tokenprice, "Check price");
             //Get owner of items address
             address payable to = payable(ownerOf(tokenId));
             to.transfer(msg.value);
    }

    function tip(address payable to) payable public{
             to.transfer(msg.value);
             tips[to] += msg.value;
    }

    function tipScore(address userAddress) public returns (uint256) {
             return tips[userAddress];
    }
}
