const main = async () => {
  const bananaContractFactory = await hre.ethers.getContractFactory("BananaPortal");
  const bananaContract = await bananaContractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.1"),
  });
  await bananaContract.deployed();
  console.log("Endereço do contrato:", bananaContract.address);

  /*
   * Consulta saldo do contrato
   */
  let contractBalance = await hre.ethers.provider.getBalance(
    bananaContract.address
  );
  console.log(
    "Saldo do contrato:",
    hre.ethers.utils.formatEther(contractBalance)
  );

  /*
   * Enviar tchauzinho
   */
  let bananaTxn = await bananaContract.banana("Enviando banana #1");
  await bananaTxn.wait();

  let bananaTxn2 = await bananaContract.banana("Enviando banana #1");
  await bananaTxn2.wait();

  /*
   * Recupera o saldo do contrato para verificar o que aconteceu!
   */
  contractBalance = await hre.ethers.provider.getBalance(bananaContract.address);
  console.log(
    "Saldo do  contrato:",
    hre.ethers.utils.formatEther(contractBalance)
  );

  let allBananas = await bananaContract.getAllBananas();
  console.log(allBananas);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();