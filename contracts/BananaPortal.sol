// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract BananaPortal {

    uint256 totaBanana;
    uint256 private seed; // gerar um número rândomico

    event NewBanana(address indexed from, uint256 timestamp, string message);

    struct Banana{
        address waver; // Endereço do usuário que mandou a banana
        string message; // Mensagem do Usuário
        uint256 timestamp; // Data/hora de quando o usuário mandou a banana
    }

    Banana[] bananas; // Armazena o array de structs
    mapping(address => uint256) public lastWavedAt;

    constructor() payable {
        console.log("Enviando bananas...");
        seed = (block.timestamp + block.difficulty) % 100;
    }

    function banana(string memory _message) public {


        require(
            lastWavedAt[msg.sender] + 15 minutes < block.timestamp,
            "Espere 15m"
        );
        lastWavedAt[msg.sender] = block.timestamp;

        totaBanana += 1;
        console.log("%s tchauzinhou!", msg.sender);

        bananas.push(Banana(msg.sender, _message, block.timestamp));

        /*
         * Gera uma nova semente para o próximo que mandar um tchauzinho
         */
        seed = (block.difficulty + block.timestamp + seed) % 100;

        console.log("# randomico gerado: %d", seed);

        if (seed <= 50) {
            console.log("%s ganhou!", msg.sender);

            uint256 prizeAmount = 0.0001 ether;
            require(
                prizeAmount <= address(this).balance, "Tentando sacar mais dinheiro que o contrato possui."
            );
            (bool success, ) = (msg.sender).call{value: prizeAmount}("");
            require(success, "Falhou em sacar dinheiro do contrato.");
        }

        emit NewBanana(msg.sender, block.timestamp, _message);
       
    }

    function getAllBananas() public view returns (Banana[] memory) {
        return bananas;
    }

    function getTotalBananas() public view returns (uint256) {
        console.log("Temos um total de %d bananas!", totaBanana);
        return totaBanana;
    }
}