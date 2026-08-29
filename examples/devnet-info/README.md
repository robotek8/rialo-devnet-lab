# Rialo DevNet Info

A minimal Rust example that connects to Rialo DevNet using the Rialo CDK.

## What it does

- Connects to Rialo DevNet
- Queries the current block height
- Prints the result to the terminal

## Run

```bash
cargo run
```

Example output:

```text
Connecting to Rialo DevNet...
Connected successfully.
Rialo DevNet block height: 4870796
```

The block height will naturally change as the network progresses.

## Stack

- Rust
- Rialo CDK 0.18.1
- Tokio
- Rialo DevNet
