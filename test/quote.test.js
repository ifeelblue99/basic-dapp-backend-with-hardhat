const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Quote", function () {
  it("Should return the new array once it's changed", async function () {
    const Quote = await hre.ethers.getContractFactory("QuoteChain");
    const quote = await Quote.deploy();

    await quote.deployed();

    expect(await quote.getAllQuotes()).to.equal(
        [["Edger Allan POE,@iFeelBlue13,There is no exquisite beauty... Without some strangeness in the proportion.,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,1648897978"]]
    );
  });
});
