pragma solidity ^0.4.11;

import './PullPayment.sol';


contract CancellablePullPayment is PullPayment {
  
  function cancelAllPayments (address dest) internal {
    totalPayments -= payments[dest];
    payments[dest] = 0;
  }

  function cancelPartialPayment (address dest, uint amount) internal {
    if (amount >= payments[dest]) {
      cancelAllPayments(dest);
    }
    else {
      totalPayments -= amount;
      payments[dest] -= amount;
    }
  }
}

