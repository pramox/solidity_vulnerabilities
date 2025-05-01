// SPDX-License-Identifier: MIT
pragma solidity ^0.6.3;

//import {Test, console2, stdError, DSTest} from "forge-std/Test.sol";
import {Test} from "forge-std/Test.sol";
//import {Congress} from "swc_104/MyToken.sol";

/*
 * UncheckedCallReturnValue
 * If send() or call() is used to transfer ether, the output value is not checked and 
 * there is a state variables update that could be wrong (or wrong event trigger), the contract is vulnerable.
 */ 
contract CongressTest is Test {
    /*Congress congress;
    BadReceiver badReceiver;


    function setUp() public {
        attacker = makeAddr("attacker");
        badReceiver = new BadReceiver();
        //Congress(uint minimumQuorumForProposals, uint minutesForDebate, int marginOfVotesForMajority, address congressLeader) {
        congress = new Congress(0, 0, 0, attacker);
    }

    function test_executeProposal() {
        //1. PRECONDITION: make member
        p.changeMembership(attacker, 1, true, 'boss');

        //1.1 Assert that the attacker is now a member
        //m = vm.load(address(congress), bytes32(uint256(???)))
        //assertEq(address(attacker), m.member)
        
        //1.2 Create proposal with amount 1000000 wei
        p.newProposalInWei(address(badReceiver), 1000000, 'good boy', 0x6c00000000000000000000000000000000000000000000000000000000000000);
        //ASSERT proposal.executed = false; proposal.proposalPassed = false;
        //proposalBeforeCall = vm.load(address(congress), bytes32(uint256(???)))
        //assertFalse(proposalBeforeCall.executed);
        //assertFalse(proposalBeforeCall.proposalPassed);

        //1.3 increase currentResult
        p.vote(0, true, 'go-go!');

        //2. trigger call()
        //(function expectCall(address where, uint256 value, bytes calldata data) external;)
        //ASSERT that call is triggered
        vm.expectCall(address(badReceiver), 1000000 wei, abi.encodeWithSelector(store.withdrawFunds.selector, 0x6c00000000000000000000000000000000000000000000000000000000000000));
        //ASSERT that throw was invoked
        expectRevert();
        p.executeProposal(0 , 0x6c00000000000000000000000000000000000000000000000000000000000000);

        //3. POSTCONDITION:
        //ASSERT proposal.executed = true; proposal.proposalPassed = true;
        //proposalAfterCall = vm.load(address(congress), bytes32(uint256(???)))
        //assertTrue(proposalAfterCall.executed);
        //assertTrue(proposalAfterCall.proposalPassed);
        
    }*/
} 

/*contract BadReceiver {

    uint public contractBalance;

    function updateBalance() public {
        contractBalance = this.balance;
    }

    fallback() {
        throw;
    }
}*/
