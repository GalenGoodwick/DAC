// contracts/whiplano_nft.cairo

%lang starknet
%builtins(serde)

from starkware.cairo.common.uint256 import Uint256
from openzeppelin.token.erc721.library import ERC721

@contract_interface
namespace IWhiplanoNFT:
    func mint(recipient: felt, metadata_uri: felt) -> ():
    func update_metadata(new_metadata_uri: felt) -> ():
end

@storage_var
func metadata_uri() -> felt:
end

@constructor
func constructor(name: felt, symbol: felt):
    ERC721::constructor(name, symbol)
    return ()
end

@external
func mint(recipient: felt, initial_uri: felt):
    ERC721::mint(recipient, Uint256(1))
    metadata_uri.write(initial_uri)
    return ()
end

@external
func update_metadata(new_metadata_uri: felt):
    let caller = get_caller_address()
    let owner = ERC721::ownerOf(Uint256(1)).owner
    assert caller == owner, 'Only NFT owner can update metadata'
    metadata_uri.write(new_metadata_uri)
    return ()
end
