# Solidity Vulnerability Analysis – SWC-104

## Overview

This project focuses on detecting vulnerabilities in Solidity smart contracts, specifically the **SWC-104: Unchecked Call Return Value** vulnerability. It automates the analysis of smart contracts using various static and dynamic analysis tools to assess whether they properly handle external call return values, a critical security concern in Ethereum smart contract development.

## What is SWC-104?

**SWC-104** refers to the "Unchecked Call Return Value" vulnerability, where a smart contract makes an external call using `.call()`, `.delegatecall()`, `.send()`, or `.transfer()` and fails to check the return value. This can lead to unexpected behavior or security exploits, especially if the call fails silently.

## Tools Used

The project integrates and evaluates the following security analysis tools:

- **Mythril**
- **Foundry**

[View the full project report (PDF)](SmartContractReport.pdf)
[And the exploit report here (PDF)](SmartContractExploitReport.pdf)


## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Installation

### Fetch existing Docker Image
1. docker pull ghcr.io/foundry-rs/foundry:latest
2. docker tag ghcr.io/foundry-rs/foundry:latest foundry:latest

### Build Docker Image locally
1. git clone https://github.com/foundry-rs/foundry.git
2. docker build -t foundry .

### Use a provided toolchain
1. curl -L https://foundry.paradigm.xyz | bash
2. foundryup

### VisualStudie Extension:
https://marketplace.visualstudio.com/items?itemName=NomicFoundation.hardhat-solidity#foundry-experimental

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
