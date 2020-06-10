pragma solidity 0.5.15;

import "../QVContract/QVContract.sol";

contract QVFactory_ds is Owner {
    using SafeMath for uint256;

    address public TCAddr;

    QVContract QV;

    uint256 public QVCtr;

    mapping ( address => uint256 ) public QVRegis;
    mapping ( uint256 => address ) public QVRegisInv;

}
