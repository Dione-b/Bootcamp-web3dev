const main = async () => {
  const bananaContractFactory = await hre.ethers.getContractFactory("BananaPortal");
  const bananaContract = await bananaContractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.001"),
  });

  await bananaContract.deployed();

  console.log("Endereço do WavePortal: ", bananaContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();