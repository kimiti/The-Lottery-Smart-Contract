// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.8.0;

contract Lottery {
    //dynamic array with players payable addresses
    //in solidity version newer than 0.5.0 an address must be payable to be able to receive funds (using the transfer function)
    address payable[] public players;

    address public manager; //contract manager

    //contract constructor, runs once at contract deployment
    constructor() public {
        //the manager is the account address that deploys the contract
        manager = msg.sender;
    }

    //this fallback payable function will be automatically called when somebody
    //sends ether to our contract address
    //since solidity 0.5.0 it's mandatory to be external
    receive() external payable {
        require(msg.value >= 0.01 ether);
        players.push(msg.sender);
    }

    function get_balance() public view returns (uint256) {
        require(msg.sender == manager);
        return address(this).balance; //return contract balance
    }
}
