// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, ERC20Burnable {
    string public store;


    constructor() ERC20("Degen", "DGN") {
        store = "The Official Degen store has the following redeemable items: 1. Pen 2. Toy 3. Car ";
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function redeem(uint256 choice) public  {
       
        if (balanceOf(msg.sender) < 50) {
            revert("Insufficient Balance");
        }
        assert(choice >= 1 && choice <= 3);
        _burn(msg.sender, choice * 2);
       
    }

   function Donate() public {
        
        require(balanceOf(msg.sender) >= 5, "Insufficient Tokens for Donation");
        _burn(msg.sender, 1);
        
        emit DonationMade("You made a donation!");
    }

    
    event DonationMade(string message);

    function getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
