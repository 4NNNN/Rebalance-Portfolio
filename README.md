# Defi Rebalance Portfolio

Goerli contract Address - 0x9A1EbaA48297229195302a998AFB9e60aC0f77fd (ARB,USDT,LLB assets as aldready been configured and tested - transaction hashes are attached below)

ARB erc20 contract address - 0x246Edf1B3199D21FD29e62ff4d9c94b5e0d541b6

LLB erc20 contract address - 0x7F9BBD75Cd137C2819DAd6bA1287a5b000Be435C

USDT erc20 contract address - 0x03E7568Bbe49AF8020E18Ec2D29A1bF5c3D10C2f

**Transaction Hashes :**

Deposit of USDC and auto-rebalance: https://goerli.etherscan.io/tx/0x1b6d6b70179798b639d46a7b8dd0cd3284509fa7c1da21d19916bd74b27323d2

Manual rebalance - https://goerli.etherscan.io/tx/0x3ae489c7fc06cc19a807b56f8fa443f9ce642878cf8ee50064badcbb853beb5a

**Uniswap V2 pairs created:**

USDC <-> ARB,USDT,LLB

Accepts **USDC** and local pairs - **ARB,USDT,LLB**

# Testing Purposes:

1. Deploy a fresh smart-contract/autobalance.sol smart contract in GOERLI and it must be done in goerli as the USDC contract address is hardcoded.
2. Copy and paste the autobalance contract address in the [appconfig.js](https://github.com/4NNNN/Rebalance-Portfolio/blob/99b4855c5fcca24d54248ab23f928adc0d4d0cd8/src/context/AppConfig.js#L12) frontend
3. Run npm i and configure the project, then run "npm start"
4. Click the [link](https://goerli.etherscan.io/address/0x8c803734e66EAeE8DCF1c9BE9c18747A4b302480) to USDC contract and mint some USDC to your wallet (But as mint function is ownable, please create a issue in the repo with wallet address of yours. I will mint USDC to your wallet for testing purposes !!)
5. Navigate to the frontend of the project, click configure automatically configures (swaptimelimit,slippage and goerli uniswaprouteraddress)
6. Then add assets with params as given --> (ARB,ARB,0x246Edf1B3199D21FD29e62ff4d9c94b5e0d541b6,2000),(LBB,LBB,0x7F9BBD75Cd137C2819DAd6bA1287a5b000Be435C,2000),(USDT,USDT,0x03E7568Bbe49AF8020E18Ec2D29A1bF5c3D10C2f,2000)
7. The ratio is 20% which is 2000/10000 as solidity decimals restriction and required ratio in the assignment details is 20%. Or else any percentage of ratio can be configured be it 0 to 10000 which is 0% to 100%
8. Deposit and rebalance function -> transferfrom's USDC from msg.sender to contract and auto-rebalances
9. Rebalance manually rebalances all the assets
10. The edge cases like less liquidity is solved by [hassufficientliquidity](https://github.com/4NNNN/Rebalance-Portfolio/blob/99b4855c5fcca24d54248ab23f928adc0d4d0cd8/Smart-contract/autobalance.sol#L478) function
11. Tokenprices for now can only be checked through the smart contract only.

The key points :
- Loops through assets and calculates amount to allocate based on ratio
- Transfers USDC to buy each asset up to the allocation amount
- Adjusts remaining USDC balance as it goes
- Calculate target per asset based on ratio
- Allocate the min(target, remaining balance) to each asset
- Update remaining balance after each allocation
- Exit when remaining hits zero


# UML Diagram

![UML](https://github.com/4NNNN/Rebalance-Portfolio/assets/77784341/17c6fcf6-85e8-4bae-955d-71190809a0e7)






# Demo Video


https://github.com/4NNNN/Rebalance-Portfolio/assets/77784341/901893bc-769d-4697-8ff9-c34cdba0140f







