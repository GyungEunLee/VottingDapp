pragma solidity 0.5.16;

contract Election{

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;


    uint public candidatesCount;

    function addCandidate (string memory _name)private{
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);

    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender], "This Voter has already voted!");

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "There is no such candidate");

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }


    constructor() public{
        addCandidate("Candidate1");
        addCandidate("Candidate2");
    }
}