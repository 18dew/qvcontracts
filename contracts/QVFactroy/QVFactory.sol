pragma solidity 0.5.15;

import "./QVFactory_ds.sol";

contract QVFactory is QVFactory_ds {

    constructor(address _TAddr)
        public
    {
        OwnerAddress = msg.sender;
        TCAddr = _TAddr;
    }

    function createQV( uint256 _base , uint256 _exponent , uint256 _proposalCost , uint256 _PStartDate , uint256 _PEndDate , uint256 _VstartDate , uint256 _vEndDate )
        public
    {
        QV = new QVContract( TCAddr ,  _base ,  _exponent ,  _proposalCost ,  _PStartDate ,  _PEndDate ,  _VstartDate ,  _vEndDate , msg.sender );
        QVCtr = QVCtr.add(1);
        QVRegis[ address(QV)] = QVCtr;
        QVRegisInv[ QVCtr ] = address(QV);
    }

}
