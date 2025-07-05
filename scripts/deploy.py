# scripts/deploy.py

import asyncio
from starknet_py.net.full_node_client import FullNodeClient
from starknet_py.contract import Contract
from starknet_py.net.account.account import Account

async def main():
    client = FullNodeClient(node_url="https://alpha4.starknet.io")
    account = Account(
        address="YOUR_ACCOUNT_ADDRESS",
        client=client,
        key_pair="YOUR_KEY_PAIR"
    )

    with open("compiled/whiplano_nft.sierra", "r") as f:
        contract_class = f.read()

    # Deploy
    deployment_result = await Contract.deploy(
        account=account,
        class_hash=contract_class,
        constructor_args=["WhiplanoNFT", "WHPL"]
    )
    print("Contract deployed at:", deployment_result.deployed_contract.address)

asyncio.run(main())
