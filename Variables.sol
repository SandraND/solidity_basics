// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; // tells solidity versions

// contract name should normally be the same as the file name
// the contract instructions
contract Variables {
    // state variables, available in all the contract
    int number = 10; // 256 bits
    int8 miniNumber = 1; // 8 bits
    int16 smallNumber = 8; // 16 bits
    uint unsignedNumber = 50; // here we can only store positive numbers.
    bool booleanValue = true; 
    address myAddress = 0x8f8e7012F8F974707A8F11C7cfFC5d45EfF5c2Ae; // defines a wallet address
    bytes32 someBytes = "name"; // a more efficient way to store strings as bytes
    // the heavier the code, variables, numbers, etc,
    // the more gas solitidy needs for a transaction, so be wfficient.
    struct PencilStruct {
        string name;
        string color;
        string pencilType;
    } // defines a structure with three items (a variable with variables inside)

    // local variables, available inside functions, but not in all contract

    // visibility states
    int public publicNumber = 20; // a variable with the keyword 'public' can be "seen" and "changed" from outside the contract
    uint internal internalUint = 10; // internal variables can only be modified by this contract and its derived contracts. They cannot be seen or changed in other contracts
    string private privateVariable = "private!"; // cannot be seen from outside this contract

    // function name (parameter type parameter name) visibility state state mutability returns(type) {}


    // 1. Define a new function called addNumber in the Variables contract.
    // 2. (uint ) data type specifier that indicates that _number is an unsigned number (a positive number)
    // 3. ( _number) the _ prefix means that this variable is not intended for public use
    // 4. 'public' keyword means that anyone can call this function from ouside the contract, as long as they have permissions
    // 5. 'pure' is a type of function that has no side effects and doesn't modify any external state. meaning, it only depends on its inputs to produce an output.
    // 6. returns (uint), the type of value this function will return
    function addNumber(uint _number) public pure returns (uint) {
        uint value = 10;
        value = value + _number;
        return value;
    }

    // more ineficient way to do structs 
    PencilStruct public redPencil = PencilStruct("Red Pencil", "red", "slim");
}
