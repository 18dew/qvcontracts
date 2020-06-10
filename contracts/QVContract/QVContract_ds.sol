pragma solidity 0.5.15;

import "../token/TokenContract.sol";

contract QVContract_ds is Owner{
    using SafeMath for uint256;

    TokenContract TContract;
    address public TCAddr;

    uint256 public Base;
    uint256 public Exponent;

    uint256 public ProposingCost;

    uint256 public PstartDate;
    uint256 public PendDate;

    uint256 public VstartDate;
    uint256 public VendDate;

    bytes32 public Winner;
    bool public WinnerDeclared;

    uint256 public ProposalCtr;

    mapping ( bytes32 => ProposalDetails ) public Proposals;
    mapping ( uint256 => bytes32 ) public ProposalInv;
    mapping ( address => bool ) proposers;
    mapping ( address => bool ) voted;

    struct ProposalDetails {
        string ProposalURI;
        address ProposalOwner;
        uint256 votes;
    }

    uint256 public TotalAllocation;

    modifier isHasValidTokens ( uint256 _Tokens ){
        require( ( TContract.balanceOf( msg.sender ) == _Tokens ) && ( TContract.allowance( msg.sender, address(this) ) >= _Tokens ) );
        _;
    }

    modifier isNotVoted (){
        require( voted[ msg.sender ] == false );
        _;
    }


    modifier isNotProposer (){
        require( proposers[ msg.sender ] == false );
        _;
    }

    modifier isProposer (){
        require( proposers[ msg.sender ] == false );
        _;
    }

    modifier isWinner (){
        require( Proposals[ Winner ].ProposalOwner == msg.sender );
        _;
    }

    modifier isProposingtime (){
        require( ( now >= PstartDate ) && ( now <= PendDate ) );
        _;
    }

    modifier isVotingTime (){
        require( ( now >= VstartDate ) && ( now <= VendDate ) );
        _;
    }

    modifier isVotingEnded (){
        require( ( now >= VendDate ));
        _;
    }

    modifier isWinnerDeclared (){
        require( WinnerDeclared == true);
        _;
    }

}
