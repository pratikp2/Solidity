// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

// Conditionals
// Loops

contract SampleVariables
{
    uint[] private arr = [1,2,3,4,5,6,7,8,9,10];
    address private owner;

    constructor()
    {
        owner = msg.sender;
    }

    function isOwner() view public returns(bool)
    {
        return owner == msg.sender;
    }

    function getEvenCount() view public returns(uint)
    {
        uint count = 0;

        for(uint i=0; i<arr.length; i++)
            if(isEvenNumber(arr[i]))
                count++;

        return count;        
    }

    function isEvenNumber(uint _number) pure private returns(bool)
    {
        if(_number % 2 == 0)
            return true;
        else 
            return false; 
    }
}
