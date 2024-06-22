// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    // Enum for tiered membership levels
    enum MembershipLevel { Bronze, Silver, Gold, Platinum, Diamond }

    // Structs to store player and membership data
    struct Player {
        address toAddress;
        uint amt;
    }

    struct PlayerMemberships {
        uint brnz;
        uint slvr;
        uint gld;
        uint plt;
        uint dmd;
    }

    // Arrays to store players and memberships (if needed in the future)
    Player[] public players;
    PlayerMemberships[] public memberships;

    // Mappings to track redeemed memberships
    mapping(address => PlayerMemberships) public playerMemberships;

    // Function to add players to the purchase queue
    function buyDegen(address _toAddress, uint _amt) public {
        players.push(Player({ toAddress: _toAddress, amt: _amt }));
    }

    // Function to mint tokens for all players in the queue
    function mintToken() public onlyOwner {
        while (players.length > 0) {
            uint i = players.length - 1;
            if (players[i].toAddress != address(0)) {
                _mint(players[i].toAddress, players[i].amt);
                players.pop();
            }
        }
    }

    // Function to transfer tokens to another player
    function transferDegen(address _to, uint _amt) public {
        require(_amt <= balanceOf(msg.sender), "Insufficient degen");
        _transfer(msg.sender, _to, _amt);
    }

    // Function to redeem different membership levels
    function redeemMembership(MembershipLevel _level) public {
        uint burnAmt;

        if (_level == MembershipLevel.Bronze) {
            burnAmt = 100;  // Example burn amount for Bronze level
            require(balanceOf(msg.sender) >= burnAmt, "Insufficient degen");
            playerMemberships[msg.sender].brnz += 1;
            burn(burnAmt);
        } else if (_level == MembershipLevel.Silver) {
            burnAmt = 200;  // Example burn amount for Silver level
            require(balanceOf(msg.sender) >= burnAmt, "Insufficient degen");
            playerMemberships[msg.sender].slvr += 1;
            burn(burnAmt);
        } else if (_level == MembershipLevel.Gold) {
            burnAmt = 300;  // Example burn amount for Gold level
            require(balanceOf(msg.sender) >= burnAmt, "Insufficient degen");
            playerMemberships[msg.sender].gld += 1;
            burn(burnAmt);
        } else if (_level == MembershipLevel.Platinum) {
            burnAmt = 400;  // Example burn amount for Platinum level
            require(balanceOf(msg.sender) >= burnAmt, "Insufficient degen");
            playerMemberships[msg.sender].plt += 1;
            burn(burnAmt);
        } else if (_level == MembershipLevel.Diamond) {
            burnAmt = 500;  // Example burn amount for Diamond level
            require(balanceOf(msg.sender) >= burnAmt, "Insufficient degen");
            playerMemberships[msg.sender].dmd += 1;
            burn(burnAmt);
        } else {
            revert("Invalid membership level selected");
        }
    }

    // Function to burn tokens with gas management, only callable by owner
    function burnDegen(address _of, uint _amt) public onlyOwner {
        _burn(_of, _amt);
    }

    // Function to check the token balance of the caller
    function checkBalance() public view returns (uint) {
        return balanceOf(msg.sender);
    }
}
