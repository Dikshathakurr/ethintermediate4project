# Degen gaming tokens
This solidity code is made for tokens and redeemable feature in online Degen Membership. DegenToken is an ERC20 token with tiered memberships, token burning, and minting managed by the contract owner.

# Description
This contract is written in Solidity language, a programming language used for developing smart contracts on the Ethereum blockchain. In smart contract first we imported 3 libraries ERC20, Ownable, ERC@)Burnable. The DegenToken contract is an ERC20 token with additional functionality for membership tiers and token burning. Players can purchase tokens and be added to a minting queue managed by the owner. Tokens can be transferred, redeemed for various membership levels by burning specific amounts, and balance checks can be performed by users. The contract also allows the owner to burn tokens from any address for gas management purposes.

# Getting Started
## Execution program
To run this code, first go to https://faucets.chain.link/ and claim free fuji testnet avax faucet using login via github. Now Head towards remixIDE or hardhat as per your intrest, in this project remix was used for its ease. create a new MyContract.sol file and copy the content of DegenToken.sol into it. In left side go to compile tab and choose the compatible compiler. Then in deploy section choose injection wallet (metamast, phantom, etc.). click Deploy and confirm the transaction.

# Steps 

1) Create the DegenToken contract, which sets up the "Degen" (DGN) token and assigns the contract owner.
2)  Users request tokens by calling buyDegen, specifying how many tokens they want.
3) The owner calls mintToken to mint tokens for all players in the queue.
4) Users can transfer tokens to others using transferDegen.
5) Users exchange tokens for membership levels by calling redeemMembership and burning the necessary tokens.
6)  Users check their token balance by calling checkBalance.

# Interaction with contract
As player request for token in buyDegen(). This will add the player to the queue.
Then from owner account call mintToken(). This will mint token.
Switch to player account and check balance using checkBalance(). 
now you can redeem cards by passing (0,1,2,3,4) for Cards{Bronze, Silver, Gold, Platinum, Diamond } depending upon card rarity in exchange of tokens, or can send tokens to other player's account by calling transferDegen() or can burn the token if they don't need anymore using burnDegen().

# Authors

Diksha Thakur
