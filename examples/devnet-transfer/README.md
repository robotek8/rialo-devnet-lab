# Rialo DevNet Transfer

A Rust example that creates a temporary wallet and sends a real transaction on Rialo DevNet using the Rialo CDK.

## What it does

- Creates an in-memory DevNet wallet
- Requests test RLO from the Rialo faucet
- Checks the wallet balance
- Sends 0.001 RLO to a specified recipient
- Waits for transaction confirmation
- Prints the resulting transaction signature
- Checks the remaining wallet balance

## Run

```bash
cargo run -- <RIALO_RECIPIENT_ADDRESS>
```

Example flow:

```text
Creating temporary Rialo DevNet wallet...
Requesting 0.01 RLO from DevNet faucet...
Temporary wallet balance: 0.01 RLO
Sending 0.001 RLO...
Transfer confirmed!
Transaction: <TRANSACTION_SIGNATURE>
Remaining temporary balance: 0.008995 RLO
```

## Notes

The wallet used by this example exists only in memory.

The example is intended for Rialo DevNet and uses faucet funds only.

No private keys are committed to this repository.

## Stack

- Rust
- Rialo CDK 0.18.1
- Tokio
- Rialo DevNet
