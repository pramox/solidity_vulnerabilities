// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2, stdError} from "forge-std/Test.sol";
import {Proxy} from "swc_112/proxy.sol";

contract ProxyTest is Test {
    Proxy p;

    function setUp() public {
        p = new Proxy();
    }

    /*
    test_Description for standard tests.
    testFuzz_Description for fuzz tests.
    */

    function testFuzz_forwardCallingAttackerContracts(address attacker, bytes memory data) public {
        //Postcondition: expect that the attacker contract is called
        vm.expectCall(attacker, data);//Vm.sol address callee, bytes calldata data
        p.forward(attacker, data);
    }
}