// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./TestNFT.sol";

contract MarketSaleTest is Test {
    TestNFT public ms;
    address[] public oneAddr = [address(1)];
    address[] public twoAddr = [address(1), address(2)];
    address[] public threeAddr = [address(1), address(2), address(3)];
    address[] public senderAddr = [address(msg.sender)];

    function setUp() public {
        ms = new TestNFT();
    }

    function testAddMarketOne() public {
        ms.addMarket(oneAddr);
        assertEq(ms.isSale(), false);
        ms.addMarket(senderAddr);
        assertEq(ms.isSale(), true);
    }

    function testAddMarketTwo() public {
        ms.addMarket(twoAddr);
        assertEq(ms.isSale(), false);
        ms.addMarket(senderAddr);
        assertEq(ms.isSale(), true);
    }

    function testAddMarketThree() public {
        ms.addMarket(threeAddr);
        assertEq(ms.isSale(), false);
        ms.addMarket(senderAddr);
        assertEq(ms.isSale(), true);
    }

    function testDelMarket() public {
        ms.addMarket(senderAddr);
        assertEq(ms.isSale(), true);
        ms.delMarket(senderAddr);
        assertEq(ms.isSale(), false);
    }

    function testGetMarket() public {
        ms.addMarket(senderAddr);
        assertEq(ms.getMarket(0), senderAddr[0]);
        ms.addMarket(oneAddr);
        assertEq(ms.getMarket(1), oneAddr[0]);
    }
}
