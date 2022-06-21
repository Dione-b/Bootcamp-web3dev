# Projeto Mande um Salve

Projeto simples que recebe uma mensagem e a guarda na blockchain, também tem uma pequena chance de receber uma quantidade de ether de volta.

# Tecnologias utilizadas

- Hardhat
- Ethers
- Solidity
- Javascript
- Alchemy
- Chai
# inicialização do projeto

Execute o seguinte comando para inicializar as dependências do projeto:
```shell
  npm install
```
Logo após instalar as dependências, execute o comando para compilar nosso contrato: 
```shell
  npx hardhat compile
```
Após a compilação poderemos fazer o deploy do nosso contrato na rede de teste (rinkeby) com o comando:
```shell
  npx hardhat run scripts/run.js --network rinkeby
```

obs: Lembre-se de adicionar sua chave privada e sua key URL da plataforma Alchemy no arquivo `.env` antes de compilar o contrato.
