// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract HotelRooms
{
    enum Status
    {
        booked,
        vacant
    }

    address payable public owner;
    Status private currentStatus;
    event Occupy(address, uint);

    constructor()
    {
        owner = payable(msg.sender);
        currentStatus = Status.vacant;
    }

    modifier checkIfVacant
    {
        require(currentStatus == Status.vacant, "Currenly room is booked ...!");
        _;
    }

    modifier checkCost(uint _amount)
    {
         require(msg.value > _amount, "Payment provided is less than the actual payment required..!");
         _;
    }

    receive() external payable checkIfVacant checkCost(2 ether)
    {
        owner.transfer(msg.value);
        currentStatus = Status.booked;
        emit Occupy(msg.sender, msg.value);
    }
}

// external : Cannot be accessed internally, only externally

// payable : A payable address or payable function can recieve ether.

// require(<condition>, <Error mesage>) : Similar to assert Function.
//      Condition is required to met in order to execute next code.

// modifier : modifier wont allow a function to unless underlying require() is successdully executed.

// event : evets are emitted once a desired activity is completes, which is caught by a subscriber 
//          For Example in above case event may be caught by a subcriber function who may provide access to the room
//          or give keys to the room owner

// receive() :
// receive is a new keyword in Solidity 0.6.x that is used as a fallback function that is only able to receive ether.
// receive() external payable — for empty calldata (and any value)
// fallback() external payable — when no other function matches (not even the receive function). Optionally payable.
// Solidity 0.6.x introduced the receive keyword in order to make contracts more explicit when their fallback functions are called.
// The receive method is used as a fallback function in a contract and is called when ether is sent to a contract with no calldata.
// If the receive method does not exist, it will use the fallback function.