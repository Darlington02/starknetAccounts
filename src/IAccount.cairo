%lang starknet

from openzeppelin.account.library import AccountCallArray

@contract_interface
namespace IAccount {

    func isValidSignature(
        hash: felt,
        signature_len: felt,
        signature: felt*,
    ) -> (isValid: felt){
    }

    func __validate__(
        call_array_len: felt,
        call_array: AccountCallArray*,
        calldata_len: felt,
        calldata: felt*,
    ) {
    }

    func __execute__(
        call_array_len: felt,
        call_array: AccountCallArray*,
        calldata_len: felt,
        calldata: felt*,
    ) -> (
        response_len: felt,
        response: felt*,
    ) {
    }

    // ERC165
    func supportsInterface(interfaceId: felt) -> (success: felt) {
    }
}