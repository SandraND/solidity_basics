// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract RentCar {
    // This address owns the contract and receives the payments
    address payable public contractOwner;
    enum CarConditions{Available, Rented}
    CarConditions car;

    event CarStatusUpdated(address _customer, uint _amount);

    modifier statusError {
       // check that the car is avaiable, if not, the transaction is reverted
        require(car == CarConditions.Available, "The car is already rented.");
        // after the require is checked, then run the function
        _;
    }
    
    modifier paymentError(uint _value) {
         // check that the address calling the function is sending at least the value received by param
        require(msg.value >= _value, "Not enough ETH to rent the car.");
        // after the require is checked, then run the function
        _;
    }

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
    // we'll add the modifiers to check the data
    function rentCar() payable public statusError paymentError(2 ether) {
        // take the value that the address calling the function is sending and transfer it to the owner
        contractOwner.transfer(msg.value);
        // change the status of the car to rented
        car = CarConditions.Rented;
        // emits an event to notify the owner of the event that the car has been rented
        emit CarStatusUpdated(msg.sender, msg.value);
    }

    // function to set the status back to available when the car is returned
    function returnCar() public {
        car = CarConditions.Available;
    }

    // any time an address sends money to this contract, the function is automatically called
    // the visibility is external and can only be called from outside the contract
    receive() external payable statusError paymentError(2 ether) { 
        // take the value that the address calling the function is sending and transfer it to the owner
        contractOwner.transfer(msg.value);
        // change the status of the car to rented
        car = CarConditions.Rented;
        // emits an event to notify the owner of the event that the car has been rented
        emit CarStatusUpdated(msg.sender, msg.value);
    }
}
