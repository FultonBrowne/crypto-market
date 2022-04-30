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
    function createListing(address lister, string memory tokenURI, uint256 price) public
returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(lister, newItemId);
        prices[newItemId] = prices;
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function buy(uint256 tokenId) public{
             tokenprice = prices[tokenId];
             require(msg.value == tokenprice, "Check price");
             //Get owner of items address
             to = ownerOf(tokenId);
             to.send(msg.value);
    }

    function tip(address to) public{
             to.send(msg.value);
             tips[to] += msg.value;
    }

    function tipScore(address userAddress) public constant returns (uint) {
             return tips[userAddress];
    }
}
