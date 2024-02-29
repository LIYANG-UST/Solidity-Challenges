// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Q: Which function consumes more gas?
// A: The first contract consumes less gas than the second one.

contract FunctionSequenceGasCost_LongName {
    // fuction signature : 0x8381f58a
    uint256 public number = 10;

    // fuction signature : 0x358c5527
    function ThisIsAVeryLongFunctionNameThatDoesTheSameThingAsTheShortOne() public {
        number++;
    }
}

contract FunctionSequenceGasCost_ShortName {
    uint256 public number = 10;

    // fuction signature : 0xf446c1d0
    function A() public {
        number++;
    }
}


// Explanation
// After a smart contract is compiled, the function names are hashed as "function signature" and stored in the contract's bytecode.
// Its order is determined by the alphabet order of the functions in the contract.
// 
// For these two contracts, it has two functions for each.
// (! Public state variables will automatically generate a getter function when compiled)
// 
// Online keccak256 hash generator: https://emn178.github.io/online-tools/keccak_256.html 
// Function signatures:
// function number() public view returns (uint256);   <==>  0x8381f58a
// function ThisIsAVeryLongFunctionNameThatDoesTheSameThingAsTheShortOne() public;  <==> 0x358c5527
// function A() public;  <==> 0xf446c1d0
//
// In the first contract, the order is 
// 0x358c5527 , 0x8381f58a
// In the second contract, the order is
// 0x8381f58a , 0xf446c1d0 
//
// When calling a smart contract function, the EVM will look for the function signature in the contract's bytecode.
// Those function signatures which are at the beginning of the bytecode will be found faster. (less gas cost)
// So the first contract consumes less gas than the second one.