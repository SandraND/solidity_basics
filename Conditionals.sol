// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// conditionals handle decisions
// in solidity conditionals are if/else statements

contract Conditionals {
    address public owner;
    constructor(){
        // get the owner as soon as the contract is created
        owner = msg.sender;
    }

    // check if the address that calls the function is the owner of the contract 
    function isOwner() public view returns(bool) {
        return msg.sender == owner;
    }
    
    function isTrue() public view returns (bool){
        //returns true if the sender is the owner of the contract
        return address(this).balance == 0;
    }

    function bigNumber(uint _number) public pure returns(bool) {
        return _number > 5;
    }

    uint[] public values = [3, 10, 7, 15, 4, 2, 8, 12, 19, 6];
    
    function countElements() public view returns(uint) {
        uint count = 0;
        for (uint i=0; i < values.length; i++){
            count++;
        }
        return count;
        //simplified:
        // return values.length;
    }

    function biggerThan() public view returns(uint[2] memory) {
        uint bigger = 0;
        uint smaller = 0;

        for (uint i=0; i < values.length; i++){
            if (bigNumber(values[i])){
                bigger++;
            } else {
                smaller++;
            }
        }
        return [ bigger, smaller ];
    }

    function goToZero() public pure returns(uint) {
        uint times = 10;
        uint howMany;
        
        while(times > 0) {
            howMany++;
            times--;
        }
        return howMany;
    }
}
