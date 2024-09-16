//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    //import 
    using PriceConverter for uint256;
    // minimumUsd variable setting minimum donation limit 
    uint256 public minimumUsd = 5 *  1e18; // 5e18

    // array of addresses of funders
    address[] public funders;

    // mapping address to Amount funded by it
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        // Alliow users to send $X
        // Have a minimum $ sent Limit 5$ X
        
        // 1. How do we send ETH to this contract ? 

        // Revert if fund value not bigger then 1 
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough ETH");
        //require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enaugh ETH"); 
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }
}