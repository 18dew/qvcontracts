pragma solidity 0.5.15;

import "./QVContract_ds.sol";

contract QVContract is QVContract_ds{

    constructor ( address _TCAddr , uint256 _base , uint256 _exponent , uint256 _proposalCost , uint256 _PStartDate , uint256 _PEndDate , uint256 _VstartDate , uint256 _vEndDate , address _sender )
        public
    {
        TContract = TokenContract(_TCAddr);
        TCAddr = _TCAddr;
        Base = _base;
        Exponent = _exponent;
        ProposingCost = _proposalCost;
        PstartDate = _PStartDate;
        PendDate = _PEndDate;
        VstartDate = _VstartDate;
        VendDate = _vEndDate;
        OwnerAddress = _sender;
    }

    function setProposal( string memory ProposalURI )
        isHasValidTokens( ProposingCost )
        isNotProposer
        isProposingtime
        public
        returns ( bool result )
    {
        bytes32 ProposalsHash = keccak256(abi.encodePacked( ProposalURI ));
        ProposalCtr = ProposalCtr.add(1);
        ProposalInv[ProposalCtr] = ProposalsHash;
        Proposals [ ProposalsHash ] = ProposalDetails( ProposalURI , msg.sender , 0 );
        proposers[ msg.sender ] = true;
        TotalAllocation =TotalAllocation.add(ProposingCost);
        result = transferTokens( ProposingCost );
    }

    function calculateTokens ( uint256 _votes )
        public
        view
        returns ( uint256 tokens )
    {
        tokens = Base.mul( Exponent ** _votes.sub(1) );
        return tokens;
    }

    function castVote ( bytes32 _proposal ,  uint256 _votes )
        isNotVoted
        isVotingTime
        public
        returns ( bool result )
    {
        uint256 Tokens = calculateTokens( _votes );
        Proposals[_proposal].votes = Proposals[_proposal].votes.add(_votes);
        TotalAllocation =TotalAllocation.add(Tokens);
        voted[msg.sender] = true;
        result = transferTokens( Tokens );
    }

    function transferTokens ( uint256 _tokens )
        internal
        returns ( bool result )
    {
        TContract.transferFrom(address(this) , msg.sender, _tokens );
        result = true;
    }

    function FindWinner ()
        isOwner
        public
        returns ( bool result )
    {
        uint256 ctr = 0;
        uint256 winvote = 0;
        bytes32 winhash;
        while ( ctr <= ProposalCtr ){
            if( winvote < Proposals[ProposalInv[ctr]].votes){
                winvote = Proposals[ProposalInv[ctr]].votes;
                winhash = ProposalInv[ctr];
            }
            ctr = ctr.add(1);
        }
        Winner = winhash;
        WinnerDeclared = true;
        result = true;
    }

    function claim()
        isWinner
        isWinnerDeclared
        public
        returns ( bool result )
    {
        TContract.transfer( Proposals[Winner].ProposalOwner , TotalAllocation );
        result = true;
    }
}

