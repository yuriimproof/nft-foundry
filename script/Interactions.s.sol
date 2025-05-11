// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNFT is Script {
    string public constant SHIBA_INU = "";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNFT", block.chainid);
        mintNFT(mostRecentlyDeployed);
    }

    function mintNFT(address contractAddress) public {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNFT(SHIBA_INU);
        vm.stopBroadcast();
    }
}
