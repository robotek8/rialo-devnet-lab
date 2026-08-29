# Rialo DevNet Lab

Hands-on experiments with Rialo DevNet using Rust, Rialo CDK and Venus.

This repository documents my progress from basic DevNet interaction to deploying and invoking a stateful Venus program on-chain.

## Completed

- Installed and configured Rialo CLI
- Connected to Rialo DevNet
- Created DevNet keypairs
- Requested test RLO from the faucet
- Queried Rialo DevNet through Rust RPC
- Created and signed an RLO transfer from Rust
- Built a Venus workflow
- Compiled a Venus program to PolkaVM
- Deployed the program to Rialo DevNet
- Invoked the deployed program on-chain

## Examples

### DevNet Info

`examples/devnet-info`

A minimal Rust application using Rialo CDK to connect to DevNet and query the current block height.

### DevNet Transfer

`examples/devnet-transfer`

Creates a temporary DevNet wallet, requests faucet RLO and sends a real DevNet transaction.

### Venus Counter

`examples/venus-counter`

A stateful Venus workflow that stores a counter, compiles to PolkaVM, deploys to Rialo DevNet and can be invoked on-chain.

## Project Structure

```text
rialo-devnet-lab/
├── examples/
│   ├── devnet-info/
│   ├── devnet-transfer/
│   └── venus-counter/
├── notes/
├── scripts/
└── README.md
```

## Stack

- Rust
- Rialo CLI 0.18.1
- Rialo CDK 0.18.1
- Rialo Venus 0.18.1
- PolkaVM
- Rialo DevNet
- WSL2 / Ubuntu

## Disclaimer

Personal learning repository for Rialo DevNet experimentation.

No production keys or private key material are stored in this repository.

Not affiliated with Rialo or Subzero Labs.
