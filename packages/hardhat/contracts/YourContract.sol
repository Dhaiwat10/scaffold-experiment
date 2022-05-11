pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract YourContract {
    IERC20 public dhaiToken;

    event SetPurpose(address sender, string purpose);

    string public purpose = "Building Unstoppable Apps!!!!!!!!!!";
    address public owner;
    uint256 public price = 10 ether;

    constructor(address _tokenAddress) payable {
        // what should we do on deploy?
        owner = msg.sender;
        dhaiToken = IERC20(_tokenAddress);
    }

    function setPurpose(string memory newPurpose) public {
        dhaiToken.transferFrom(msg.sender, owner, price);
        price = (price * 101) / 100;
        purpose = newPurpose;
        console.log(msg.sender, "set purpose to", purpose);
        emit SetPurpose(msg.sender, purpose);
    }

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
