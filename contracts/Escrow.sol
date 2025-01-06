//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IERC721 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _id
    ) external;
}

contract Escrow {
address public nftAddress;
address public seller;
address public inspector;
address public lender;

  mapping(uint256 => bool) public isListed;

constructor(address _nftAdress, address payable_seller, address _inspector, address  _lender) {
    nftAddress = _nftAdress;
    seller = payable_seller;
    inspector = _inspector;
    lender = _lender;
}

function list(uint256 _nftID) public {
   
  
  // Transfer NFT from seller t this contract
  IERC721(nftAddress).transferFrom(msg.sender, address(this), _nftID);
  isListed[_nftID];
}

}
