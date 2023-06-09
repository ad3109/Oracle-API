
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
* @dev
* Proxy MultiCommoditiesFeedProxy - replaces brent oil with natural gas when oil hits $0
* in contract implementation contract MultiCommoditiesFeed
*
* In a proxy contract setup, you have two main contracts: 
* A) Proxy contract 
* B) Implementation contract
*
* The proxy contract acts as a middleman, forwarding function calls to the implementation contract where 
* the actual logic resides. The implementation contract holds the state and contains the implementation of 
* the contract's functions. See steps below.
*
*/

contract MultiCommoditiesFeedProxy is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    bytes32 private jobId;
    uint256 private fee;

    // Proxy storage variables
    address private implementation;
    uint256 public btc;
    uint256 public gold;
    uint256 public oil;

    event RequestMultipleFulfilled(
        bytes32 indexed requestId,
        uint256 btc,
        uint256 gold,
        uint256 oil
    );

    constructor(address _implementation) ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
        setChainlinkOracle(0x6090149792dAAeE9D1D568c9f9a6F6B46AA29eFD);
        jobId = "53f9755920cd451a8fe46f5087468395";
        fee = (1 * LINK_DIVISIBILITY) / 10;
        implementation = _implementation;
    }

    function requestMultipleParameters() public {
        MultiCommoditiesFeed(implementation).requestMultipleParameters();
    }

    function fulfillMultipleParameters(
        bytes32 requestId,
        uint256 btcResponse,
        uint256 goldResponse,
        uint256 oilResponse
    ) public recordChainlinkFulfillment(requestId) {
        emit RequestMultipleFulfilled(
            requestId,
            btcResponse,
            goldResponse,
            oilResponse
        );
        btc = btcResponse;
        gold = goldResponse;

        // Replace oil with natural gas if oil price is $0
        if (oilResponse == 0) {
            oil = getNaturalGasPrice();
        } else {
            oil = oilResponse;
        }
    }

    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }

    // Custom function to retrieve natural gas price
    function getNaturalGasPrice() private returns (uint256) {
        // Implement the logic to fetch the natural gas price here
        // feed 4 NaturalGas
        req.add(
            "urlNG”,
            "https://commodities-api.com/api/latest?access_key=ho90ir8l3777dymv9s6vzblbt5p34udvu3bqub662168au23b963x0gzq7kg"
         );
         req.add("pathNG”, “NG”);
         req.add("pathNG”, "x.data.rates.NG”);
    }
}

// Contract interface for the implementation contract
abstract contract MultiCommoditiesFeed {
    function requestMultipleParameters() public virtual;
}

/** 
* 1) When you want to upgrade the logic of the contract, you deploy a new implementation contract with the updated code. 
* 2) Then, you update the proxy contract's implementation address to point to the new implementation contract. 
* 3) From that point forward, any function calls made to the proxy contract will be redirected to the updated logic in the 
*    new implementation contract
*/
