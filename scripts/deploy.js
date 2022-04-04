const hre = require("hardhat")
async function main() {
 
  const Quote = await hre.ethers.getContractFactory("QuoteChain");
  const quote = await Quote.deploy();

  await quote.deployed();

  console.log("Quote deployed to:", quote.address);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
