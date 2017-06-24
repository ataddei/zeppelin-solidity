pragma solidity ^0.4.11;

import '../../contracts/payment/CancellablePullPayment.sol';


// mock class using PullPayment
contract CancellablePullPaymentMock is CancellablePullPayment {

  function CancellablePullPaymentMock() payable { }

  // test helper function to call asyncSend
  function callSend(address dest, uint amount) {
    asyncSend(dest, amount);
  }

  function rejectPayments() {
    address payee = msg.sender;
    cancelAllPayments(payee);
  }


}
