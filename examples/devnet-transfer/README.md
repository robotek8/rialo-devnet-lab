# DevNet Transfer

My next Rialo CDK experiment after reading the DevNet block height.

This program:

- creates a temporary in-memory wallet
- requests test RLO from the DevNet faucet
- checks its balance
- sends 0.001 RLO
- waits for confirmation
- prints the transaction signature

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
Remaining temporary balance: 0.008995 RLO
```

## What I learned

This was the first time in this repo that my own Rust program created and submitted a transaction instead of only reading network data.

The wallet is temporary and exists only in memory.

This is DevNet code and uses faucet funds only.
