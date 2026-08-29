# Rialo DevNet Setup

Notes from my first hands-on sessions with Rialo DevNet.

## Environment

- Windows 11
- WSL2
- Ubuntu
- Rust
- Cargo
- Rialoman
- Rialo CLI 0.18.1

## Completed

### Tooling

- Installed WSL2 / Ubuntu
- Installed Rust toolchain
- Installed `rialoman`
- Installed Rialo CLI
- Connected the CLI to Rialo DevNet

### Wallet and DevNet

- Generated DevNet keypairs
- Requested test RLO from the faucet
- Confirmed a funded DevNet account

### Rust RPC

Created `examples/devnet-info`.

The application connects to Rialo DevNet using Rialo CDK and queries the current block height.

### Rust Transaction

Created `examples/devnet-transfer`.

The application:

- creates an in-memory wallet
- requests faucet RLO
- sends 0.001 RLO
- waits for confirmation
- prints the transaction signature

### Venus Program

Created `examples/venus-counter`.

The workflow:

- stores a `counter`
- accepts an `amount`
- increments the counter
- generates a WIT interface
- generates a Venus manifest
- compiles to PolkaVM
- deploys to Rialo DevNet
- executes through an on-chain invocation

## Current Milestone

The full development flow has been completed:

```text
Rust source
    ↓
Venus DSL
    ↓
WIT + manifest
    ↓
PolkaVM artifact
    ↓
Rialo DevNet deployment
    ↓
On-chain invocation
```

## Next Experiments

- Explore more Venus workflow features
- Add multiple workflow functions
- Experiment with persistent state
- Explore REX functionality
- Explore external data / HTTP capabilities
- Build a more useful DevNet application

## Security

Only Rialo DevNet is used.

Private keys, seed phrases and production credentials must never be committed to this repository.
