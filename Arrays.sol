// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Arrays {
    // fixed size arrays
    uint[4] public numbersArray = [1, 2, 3, 4];
    string[1] public stringArray = ["We can only have one string here."];

    // dynamic size arrays
    // one dimension array
    uint[] public numbersArrayDynamic = [10];

    // two dimensions array (matrix)
    // [][] first box is the length for each specified element, the second is the number of elements inside the first array.
    uint[][2] public nesting = [[1, 2, 3],[1, 2, 3]]; // an array containing 2 arrays. max 15 nested arrays.
    uint[2][2] public matrixDynamic = [[1, 2],[1, 2]]; // an array with max 2 length inside each nested array.

    // not using any state mutability (view, pure) because this function will modify the blockchain
    function addNumber(uint _number) public {
        numbersArrayDynamic.push(_number);
    }

    // we use view because we're not going to modify the blockchain
    function countElements() public view returns(uint) {
        return numbersArrayDynamic.length;
    }
}
