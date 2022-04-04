# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```


/*
import React from 'react';
import '../style.css';
import Quote from './Quote';
import { quoteAbi, quoteContractAddress } from '../contract/abi-address.js';
import { ethers } from 'ethers';

export default function QuoteHolder() {
  const [quotes, setQuotes] = React.useState([]);
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const quoteSmartContract = new ethers.Contract(
    quoteContractAddress,
    quoteAbi,
    provider
  );
  quoteSmartContract.on('PostQuoteEvent', (newQuote, event)=>{
    console.log(newQuote)
    //setQuotes(prev=>[...prev, newQuote])
  });
  React.useEffect(() => {
    quoteSmartContract.getAllQuotes().then((dt) => {
      setQuotes(dt);
      console.log(dt);
    });
  }, []);

  return (
    <div className="quote-holder">
      {quotes.map((el) => {
        return (
          <Quote
            key={el[4].Hex}
            author={el[0]}
            publisherName={el[1]}
            quote={el[2]}
            publisher={el[3]}
          />
        );
      })}
    </div>
  );
}
//////////////////////////////
import React from 'react';
import { ethers } from 'ethers';
import { quoteAbi, quoteContractAddress } from '../contract/abi-address.js';
import '../style.css';
import { useSelector } from 'react-redux';

export default function PostQuote() {
  //
  const signer = new ethers.providers.Web3Provider(window.ethereum).getSigner();
  const quoteSmartContract = new ethers.Contract(
    quoteContractAddress,
    quoteAbi,
    signer
  );

  //
  const isConnected = useSelector((state) => state.conncted);
  const [formData, setFormData] = React.useState({
    author: '',
    publisherName: '',
    quote: '',
  });
  //
  function handleChange(event) {
    const { name, value } = event.target;
    setFormData((prev) => {
      return {
        ...prev,
        [name]: value,
      };
    });
    console.log(formData);
  }
  // submit
  async function handleSubmit(event) {
    event.preventDefault();
    if (!isConnected) return;
    const { author, publisherName, quote } = formData;
    quoteSmartContract
      .postQuote(author, publisherName, quote)
      .then((dt) => console.log(dt));
  }

  return (
    <div className="post">
      <h2>Post quote</h2>
      <form onSubmit={handleSubmit}>
        <input
          onChange={handleChange}
          name="author"
          type="text"
          value={formData.author}
          placeholder="Author"
        />
        <input
          onChange={handleChange}
          name="publisherName"
          type="text"
          value={formData.publisherName}
          placeholder="Your name"
        />
        <textarea
          onChange={handleChange}
          name="quote"
          value={formData.quote}
          placeholder="Quote"
        />
        <button id="post-button">Post</button>
      </form>
    </div>
  );
}

*/
