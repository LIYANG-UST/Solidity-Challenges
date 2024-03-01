// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Q: After deploying the first contract, what is the value of password and number? 
//    And what is the value of number in the second contract?
// A: First contract: password = 100, number = 100
//    Second contract: number = 1

contract ConstructorStateVariables {
    uint256 public password = getNumber();
    uint256 public number = 100;

    SmallPool public smallPool;

    constructor() {
        smallPool = new SmallPool(password);
        password = number;
    }

    function getNumber() public view returns (uint256) {
        return number + 1;
    }
}

contract SmallPool {
    uint256 public number;

    constructor(uint256 _number) {
        number = _number;
    }
}

// Explanation
// The state variables are initialized in the order they are declared.
// Tip: we will use a [value1, value2, value3] to represent the states of the state variables.
//      [password, number, number]
// 
// Initializations to be done when deployed:
// - State variables that has a intial value
// - Constructor logic
//
// Step1: [1, 0, 0]
// We initialize `password` with `getNumber` function, 
// which returns `number + 1` (0 + 1 = 1).  (!! Till now,  `number` has not been initialized so it is 0)
// 
// Step2: [1, 100, 0]
// Then we intialize `number` with 100.
//
// Stpe3: [1, 100, 1]
// Then we create a new `SmallPool` contract and pass `password` to it.
// The `SmallPool` contract's `number` is initialized with `password` (1).
//
// Step4: [100, 100, 1]
// Finally, we update `password` with `number` (100).