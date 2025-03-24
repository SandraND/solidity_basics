// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// enumerated lists restrict how many states a variable can have

// syntax: enum name {status, status, ...}
contract Enum {
    enum DoorCondition { Locked, Unlocked }
    DoorCondition door;

    constructor() {
        door = DoorCondition.Locked;
    }

    function openDoor() public {
        door = DoorCondition.Unlocked;
    }

    function closeDoor() public {
        door = DoorCondition.Locked;
    }

    function getCondition() public view returns(DoorCondition) {
        return door;
    }
}
