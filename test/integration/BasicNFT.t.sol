// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNFT} from "../../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../../src/BasicNFT.sol";

contract BasicNFTTest is Test {
    DeployBasicNFT deployer;
    BasicNFT basicNFT;

    address public USER = makeAddr("user");
    string public constant SHIBA_INU = "ipfs://QmXPFKdpXpNorkfD8U3ZWfAs4G3nCZG3MbvAidtmNhYeGW";

    function setUp() external {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function test_NameIsCorrect() public view {
        string memory expectedName = "Dog";
        string memory actualName = basicNFT.name();
        assert(keccak256(abi.encodePacked(actualName)) == keccak256(abi.encodePacked(expectedName)));
    }

    function test_CanMintNFT() public {
        vm.prank(USER);
        basicNFT.mintNFT(SHIBA_INU);

        assert(basicNFT.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(SHIBA_INU)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    }
}
