pragma solidity ^0.8.18;

contract chai{
    struct Memo{
        string name;
        string message;
        uint timestamp;
        address from;
    }

    Memo[] memos;
    address payable owner;

    constructor(){
        owner=payable(msg.sender);
    }

    function byChai(string memory name,string memory message) public payable{
        require(msg.value>0,"Please pay more than 0");
        owner.transfer(msg.value);
        memos.push(Memo(name,message,block.timestamp,msg.sender));
    }

    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}