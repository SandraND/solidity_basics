// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// mapping is a data type similar to a database and it's made of keys => values pairs.
// They start with 1 like SQL, instead of 0 like arrays.

// how to write one: mapping(var type => var type) visibility name;
// with mappings we make associations between one and another

contract Mappings {
    mapping (uint => string) public colors;

    constructor() {
        colors[1] = "orange";
        colors[2] = "yellow";
        colors[3] = "green";
    }

    // with dynamic data structures like arrays, structs and mappings in solidity,
    // the 'storage', 'memory' or 'calldata' keywords are used to indicate where these variables will be stored.
    // 'storage': this variables stay on-chain even after a function call ends. This is where persistent state of the contract lives.
    // 'memory': this indicated that the variable should reside in stack memory, which means it gets cleared once the executin flow leaves its scope.
    function addColor(uint _index, string memory _color) public {
        colors[_index] = _color;
    }

    struct Car {
        string maker;
        string model;
    }

    mapping (uint => Car) public cars;

    // the 'Car' type is passed as a parameter. The "mapping" keyword tells solidity that this variable is a mapping of type car. It allows us to use dot notation. We could also say it as an array with elements of type Car
    function addCar(uint _id, string memory _maker, string memory _model) public {
        cars[_id] = Car(_maker, _model);
    }

    mapping (address => mapping (uint => Car)) public playerCars;

    function addPlayerCard(uint _id, string memory _maker, string memory _model) public {
        // msg.sender takes the address from the wallet that calls the function.
        playerCars[msg.sender][_id] = Car(_maker, _model);
    }
}
