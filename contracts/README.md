# MyToken ERC-20 Project

## Token details

- Name: MyToken  
- Symbol: MTK  
- Decimals: 18  
- Total supply: 1,000,000 tokens (all initially assigned to the deployer account)

## What is an ERC-20 token?

An ERC-20 token is a standard type of fungible token used on EVM-compatible blockchains.  
It defines a common interface so that wallets, exchanges, and smart contracts can transfer tokens, approve spenders, and read balances in a consistent way.  
Because of this standard, any ERC-20 token can plug into existing tools without custom integration.

## Features implemented

- `totalSupply` to expose the total token supply  
- `balanceOf(address)` to read an account’s token balance  
- `transfer(address,uint256)` to send tokens from the caller to another address  
- `approve(address,uint256)` to give a spender permission to use tokens on behalf of the owner  
- `transferFrom(address,address,uint256)` to perform delegated transfers using an allowance  
- `allowance(address,address)` to check how many tokens a spender is still allowed to use  
- `Transfer` event emitted on transfers and delegated transfers  
- `Approval` event emitted when allowances are set  
- Basic validation checks for zero addresses, insufficient balances, and insufficient allowances

## Deployment with Remix

1. Opened `https://remix.ethereum.org` and created a new file `MyToken.sol` in the contracts folder.  
2. Pasted the ERC-20 contract code and compiled it with the Solidity compiler version 0.8.x with no errors or warnings.  
3. Went to the **Deploy & Run Transactions** tab, selected the **JavaScript VM** environment, and chose the `MyToken` contract.  
4. Entered `1000000` as the initial supply in the constructor input and clicked **Deploy**.  
5. Used the deployed contract panel in Remix to call functions like `name`, `symbol`, `decimals`, `totalSupply`, `balanceOf`, `transfer`, `approve`, and `transferFrom`.

## Usage examples

- **Direct transfer**  
  - From the first account (deployer), called `transfer(secondAccount, 1)` to send 1 token to a second account.  
  - Verified with `balanceOf` that the first account balance decreased by 1 and the second account increased by 1.

- **Approve and delegated transfer**  
  - From the first account, called `approve(secondAccount, 1)` to allow the second account to spend 1 token.  
  - Checked `allowance(firstAccount, secondAccount)` to confirm it returned `1`.  
  - Switched to the second account and called `transferFrom(firstAccount, thirdAccount, 1)` to move 1 token from the first to the third account.  

- **Reading balances and allowances**  
  - Used `balanceOf(address)` to track balances of all three accounts before and after each operation.  
  - Used `allowance(owner, spender)` to see the allowance go from `1` to `0` after `transferFrom`.

## Testing scenarios and results

- Deployed the contract with an initial supply of 1,000,000 tokens assigned to the deployer.  
- Tested `transfer` by sending 1 token from the deployer to a second account and confirmed balances updated correctly.  
- Tested `approve` by approving 1 token from the first account to the second account and confirmed `allowance` returned `1`.  
- Tested `transferFrom` by calling it from the second account to move 1 token from the first account to a third account, then verified:  
  - The first account’s balance decreased by 1.  
  - The third account’s balance increased by 1.  
  - The allowance between the first and second accounts decreased to `0`.  

## What I learned

- How ERC-20 tokens use `mapping` variables to store balances and allowances for each address.  
- The difference between a normal transfer (`transfer`) and a delegated transfer (`transferFrom`) using `approve` and `allowance`.  
- Why validation checks (for zero addresses, balances, and allowances) are important for basic security.  
- How to compile, deploy, and interact with a smart contract step by step using Remix IDE.  
- How to organize a small Solidity project in a public GitHub repository with source code, documentation, and screenshots.
