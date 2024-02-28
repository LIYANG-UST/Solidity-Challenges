//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Q: The state variable "password" is stored in which slot?
// A: slot 5
contract WhichSlot {
    uint16 internal tokenId; // 2 bytes - slot 0
    address public owner; // 20 bytes - slot 0
    uint128 public startTimestamp; // 16 bytes - slot 1
    bool private hasStarted; // 1 byte - slot 1
    uint32 public totalSupply; // 4 bytes - slot 1
    address[3] public buyers;  // 20bytes * 3 - slot 2,3,4
    bytes32 private password; // 32 bytes - slot 5
    bool public isLocked; // 1 byte - slot 6
}


/** Explanation
 *   32 bytes = 256 bits = 1 slot
 *   address = bytes20
 *
 *   ----------------------------------------------------
 *   |     0      |           owner            | tokenId |   # slot 0
 *   ----------------------------------------------------
 *   | 0 | totalSupply | hasStarted |   startTimestamp   |   # slot 1
 *   ----------------------------------------------------
 *   |      0       |           buyers[0]                |   # slot 2
 *   ----------------------------------------------------
 *   |      0       |           buyers[1]                |   # slot 3
 *   ----------------------------------------------------
 *   |      0       |           buyers[2]                |   # slot 4
*    ----------------------------------------------------
 *   |                    password                       |   # slot 5
 *   ----------------------------------------------------
*    |                                        | isLocked |   # slot 6
 *   ----------------------------------------------------
 *   |              ...               |     # ...
 *   ----------------------------------------------------
 *   |              ...               |     # 32 bytes = 1 slot
 *   ----------------------------------------------------
 *   |              ...               |     # ...
 *   ----------------------------------------------------
 *   |            2^256-1             |     # slot 2^256-1
 *   ----------------------------------------------------
 */ 