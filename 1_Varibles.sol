// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract SampleVariables
{
    // Member Variables

    // Arrays inside Solidity
    uint [] public intArr = [1,2,3];
    string [] public stringArr = ["Hello", "World", "....!"];
    string [] public stringEmptyArr;
    uint [][] public arr2D = [[1,2],[3,4]];

    struct books
    {
        string Name;
        string Author;
    }

    // Mappings inside Solidity (Similar to STL maps)
    mapping(uint => string) public TBBT;
    mapping(uint => books) public BookMap;
    mapping(address => mapping(uint => string)) public PC;

    // Member Functions
    constructor()
    {
        populateMaps();
        populateBooks();
        populateNestedMap();
    }

    function populateNestedMap() private
    {

        PC[0xa48F2e0bE8ab5A04A5eB1f86eaD1923f03A207fd][0] = "GDDR6";
        PC[0xa48F2e0bE8ab5A04A5eB1f86eaD1923f03A207fd][1] = "GDDR5";

        PC[0xA48f2E0Be7AB5a04A5eb1F46Ead1923f03a207FF][0] = "Ryzen";
        PC[0xA48f2E0Be7AB5a04A5eb1F46Ead1923f03a207FF][1] = "Intel";
        PC[0xA48f2E0Be7AB5a04A5eb1F46Ead1923f03a207FF][2] = "Qualcomn";

        PC[msg.sender][0] = "SSD";
        PC[msg.sender][1] = "Hard Disk";
        PC[msg.sender][2] = "NVME SSD";
    }

    function populateBooks() private
    {
            BookMap[0] = books("Brief History of Time", "Stephene Hawking");
            BookMap[1] = books("Calculas", "Sir Iasac Newton");
    }

    function populateMaps() private
    {
        TBBT[0] = "Sheldon";
        TBBT[1] = "Leonard";
        TBBT[2] = "Penny";
        TBBT[3] = "Haward";
        TBBT[4] = "KutraPalli";
    }

    function addValues(string memory _value) public 
    {
        stringEmptyArr.push(_value);    // To push the item to the end of the array
    }

    function getCount() public view returns(uint)
    {
        return stringEmptyArr.length;
    } 
}


// memory :
// Memory keywords in Solidity are analogous to Computer’s RAM.
// Much like RAM, Memory in Solidity is a temporary place to store data.
// The Solidity Smart Contract can use any amount of memory during the execution but once the execution stops, the Memory is completely wiped off for the next execution.

// storeage :
// Storage keywords in Solidity are analogous to Computer’s hard drive.
// Storage holds data between function calls.
// Storage is persistent, each execution of the Smart contract has access to the data previously stored on the storage area.