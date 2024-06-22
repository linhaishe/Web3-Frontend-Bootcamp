// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTM is ERC721, ERC721Enumerable, Ownable {
  uint256 private _nextTokenId;

  constructor(address initialOwner)
    ERC721("ihan's erc21", "NFTM")
    Ownable(initialOwner)
  {}

  function _baseURI() internal pure override returns (string memory) {
    return "http://ihan/";
  }

  function safeMint(address to) public onlyOwner {
    uint256 tokenId = _nextTokenId++;
    _safeMint(to, tokenId);
  }

  // The following functions are overrides required by Solidity.

  function _update(
    address to,
    uint256 tokenId,
    address auth
  ) internal override(ERC721, ERC721Enumerable) returns (address) {
    return super._update(to, tokenId, auth);
  }

  function _increaseBalance(address account, uint128 value)
    internal
    override(ERC721, ERC721Enumerable)
  {
    super._increaseBalance(account, value);
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable)
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }
}