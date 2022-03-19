//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BlockGameToken is ERC20, Ownable {
    constructor() ERC20("BlockGameTokens", "BGT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address receiver, uint256 amount) public onlyOwner{
        _mint(receiver, amount);
    }

    //msg.value is 1m wei 1 ** 18 *0.1
    function buyToken(address receiver) public payable{
        uint256 Rate = 1000;
        uint256 amount = msg.value ** decimals() * Rate;

        mint(receiver, amount);
        //uint value = totalSupply();
        //Vale += amount;

    }
}