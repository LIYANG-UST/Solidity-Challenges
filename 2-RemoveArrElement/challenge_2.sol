// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Q: After calling remove with index 3, what is the return value of get?
// A: [1, 2, 3, 0, 5]

// Explanation
// `delete` sets the value of the array element to its default value.

contract RemoveArrElement {
    uint256[] public array = [1, 2, 3, 4, 5];

    function remove(uint256 index) public {
        delete array[index];
    }

    function get() public view returns (uint256[] memory) {
        return array;
    }
}

