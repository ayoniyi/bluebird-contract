// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BlueBird {
    uint256 constant MAX_CHARACTER_AMOUNT = 140;
    
    // map wallet address to a string
    //map indivividual addr to tweets
    mapping(address => string) public tweets;

    //emit event
    event NewTweet(address indexed user, string newTweet, uint256 timestamp);

    function createTweet(string memory _tweet ) public {
        require(bytes(_tweet).length <= MAX_CHARACTER_AMOUNT, "Tweet is way too long");
        tweets[msg.sender] = _tweet;
        emit NewTweet(msg.sender, _tweet, block.timestamp);
    }

    function getTweet(address _user) public view returns (string memory) {
        string memory tweet = tweets[_user];
        if (bytes(tweet).length == 0) {
            return "No status set";
        }else{
            return tweet;
        }
        
    }
}
