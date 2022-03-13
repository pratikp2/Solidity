// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract SampleVariables
{
    // Arrays inside Solidity
    uint [] public intArr = [1,2,3];
    string [] public stringArr = ["Hello", "World", "....!"];
    string [] public stringEmptyArr;
    uint [][] public arr2D = [[1,2],[3,4]];


    // Mappings inside Solidity (Similar to STL maps)
    mapping(uint => string) public name;

    function addValues(string memory _value) public 
    {
        stringEmptyArr.push(_value);    // To push the item to the end of the array
    }

    function getCount() public view returns(uint)
    {
        return stringEmptyArr.length;
    } 
}