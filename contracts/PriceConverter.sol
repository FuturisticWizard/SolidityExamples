//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;

import "./tests/AggregatorV3Interface.sol";


library PriceConverter {
    
     function getPrice() internal  view returns(uint256) {
        // ADDRESS 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price ,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 2000 0000  
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal   view returns(uint256){
        // 1ETH?
        // 2000_000000000000000000 18 x 0
        uint256 ethPrice = getPrice();
        // 2000_000000000000000000 * 1_0000000000000000000) / 1e18 becouse we haqve additional 00 after multiply
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() internal  view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
