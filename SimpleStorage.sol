// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SimpleStorage {
    uint userNumber;
    struct People{
        string name;
        uint phone;
    }

    People[] public peopleArray;

    mapping (string => uint) public nameToNumber;

    // function to store a number
    function store(uint _number) public {
        userNumber = _number;
    }

    // function to get a number
    function retrieve() public view returns (uint) {
        return userNumber;
    }

    function addPerson(string memory _name, uint _phone) public {
        peopleArray.push(People(_name,_phone));
        nameToNumber[_name] = _phone;
    }
}
