// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
//TODO: add price metadata and buy function (so purchase systems only have to watch the contract)
contract StoreListings is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("StoreListing", "ITM") {}

    function createListing(address lister, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function buy(uint256 tokenId){
             tokenprice = //TODO
             require(msg.value = tokenprice, "Check price")
             //Get owner of items address
             to = ownerOf(tokenId)
             to.send(msg.value)
    }
}
