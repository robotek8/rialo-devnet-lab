# Rialo DevNet Transfer

A Rust example that creates a temporary wallet and sends a real transaction on Rialo DevNet using the Rialo CDK.

## What it does

- Creates an in-memory DevNet wallet
- Requests test RLO from the Rialo faucet
- Checks the wallet balance
- Sends 0.001 RLO to a specified recipient
- Waits for transaction confirmation
- Prints the resulting transaction signature

## Run

```bash
cargo run -- <RIALO_RECIPIENT_ADDRESS>

