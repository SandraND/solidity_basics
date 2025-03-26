// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract RentCar {
    // This address owns the contract and receives the payments
    address payable public contractOwner;
    enum CarConditions{Available, Rented}
    CarConditions car;

    constructor() {
        // The owner is established at the contract deployment
        contractOwner = payable(msg.sender);
        // The car status is Available by default at the contract creation
        car = CarConditions.Available;
    }

    function getStatus() view public returns (CarConditions) {
        return car;
    }

    // function to receive the payment and book a car
    function rentCar() payable public {
        // check that the car is avaiable, if not, the transaction is reverted
        require(car == CarConditions.Available, "The car is already rented.");
        // check that the address calling the function is sending at least 2 eth
        require(msg.value >= 2 ether, "Not enough ETH to rent the car.");

        // take the value that the address calling the function is sending and transfer it to the owner
        contractOwner.transfer(msg.value);
        // change the status of the car to rented
        car = CarConditions.Rented;
    }

    // function to set the status back to available when the car is returned
    function returnCar() public {
        car = CarConditions.Available;
    }
}
