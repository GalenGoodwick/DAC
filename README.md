# Whiplano NFT Prototype – DAC Phase I

This repo contains the initial proof-of-concept implementation for Whiplano's DAC NFT system on Starknet.

## Contents

-  Mint an ERC721-like NFT with dynamic metadata  
-  Metadata updated on transfer with external hash (e.g. PayPal tx ID)  
-  On-chain metadata history for full traceability  
-  Cairo 1.0 + Scarb + OpenZeppelin Cairo standards  

## Project Structure

contracts/ # Core Cairo smart contract
scripts/ # Deployment + interaction scripts (e.g. using starknet.py)
tests/ # Unit and integration tests
Scarb.toml # Scarb package configuration

markdown
Copy
Edit

## Next Steps

- Finalise mint + transfer logic  
- Integrate with IPFS and metadata history  
- Deploy to Starknet testnet  

The contract & logic is in and ready. Still resolving Scarb install locally, but I’ll test and deploy as soon as that’s fixed.