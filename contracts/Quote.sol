// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract QuoteChain {

    // quote
    struct Quote {
        string author;
        string publisherName;
        string quote;
        address publisherAddress;
        uint createTime;  
    }

    Quote[] quoteArr;
 
    //
    event PostQuoteEvent(Quote newQuote);
    //
    error IndexIsOutOfRange(uint num);
    //
    modifier IndexRange(uint indx) {
        if(indx < 0 || indx >= quoteArr.length)
            revert IndexIsOutOfRange(indx);
        _;
    }

    constructor() {        
        quoteArr.push(Quote(
            "Edger Allan POE", "@iFeelBlue13", 
            "There is no exquisite beauty... Without some strangeness in the proportion.",
            msg.sender, block.timestamp));
        
        emit PostQuoteEvent(Quote(
            "Edger Allan POE", "@iFeelBlue13", 
            "There is no exquisite beauty... Without some strangeness in the proportion.",
            msg.sender, block.timestamp));
    }

    function postQuote(string memory _author, string memory _publisherName, 
            string memory _quote) public {
            
            quoteArr.push(Quote(_author, _publisherName, _quote, msg.sender, block.timestamp));
            emit PostQuoteEvent(Quote(_author, _publisherName, _quote, msg.sender, block.timestamp));
        }

    function getAllQuotes() public view returns (Quote[] memory) {
        return quoteArr;
    }

    function getQuotes(uint _index) public view IndexRange(_index) returns (Quote memory) {
        return quoteArr[_index];
    }
}