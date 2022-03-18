// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyZuriToken is ERC20, Ownable {
    constructor() ERC20("MyZuriToken", "MZT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address receiver, uint256 amount) public onlyOwner {
        _mint(receiver, amount);
    }

    function buyToken(address receiver) public payable {

        uint256 pricePerEth = 1000;
        uint256 amount = msg.value ** decimals() * pricePerEth;

        _mint(receiver, amount);
        // uint256 value = totalSupply();
        // value += amount;
    }
}