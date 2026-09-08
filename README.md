# Rialo DevNet Lab

My personal learning log while exploring Rialo DevNet.

I'm not a Rust or blockchain developer. I started this repo to understand how Rialo works by actually running things instead of only reading about them.

I use AI as a learning / pair-programming tool to help me understand errors, Rust syntax and the Rialo toolchain.

Some things worked immediately. Some definitely didn't. A lot of this repo came from fixing those problems one by one.

## What I've tried so far

- Installed Rialo CLI and connected to DevNet
- Created DevNet wallets and used the faucet
- Queried DevNet block height from a small Rust program
- Sent a DevNet RLO transaction from Rust
- Experimented with the Venus DSL
- Generated WIT and a Venus manifest
- Built a PolkaVM artifact
- Deployed a small Venus counter program
- Invoked it on DevNet

## Experiments

### `examples/devnet-info`

My first small Rust/Rialo CDK experiment.

It connects to DevNet and reads the current block height.

### `examples/devnet-transfer`

A slightly more interesting experiment.

It creates a temporary wallet, gets test RLO from the faucet and sends a small DevNet transaction.

### `examples/venus-counter`

This one took considerably more trial and error.

It's a tiny stateful Venus workflow with a counter.

I used it to learn the basic flow:

```text
Venus source
   ↓
WIT / manifest
   ↓
PolkaVM artifact
   ↓
DevNet deploy
   ↓
invoke
```

## Build smoke checks

The Rust examples are intentionally separate crates with their own lockfiles. To catch accidental breakage while the lab grows, run all current examples with their pinned dependency sets:

```bash
bash scripts/check-all.sh
```

The script runs `cargo check --locked` for `devnet-info`, `devnet-transfer`, and `venus-counter`, reports each result separately, and exits non-zero if any example stops compiling.

GitHub Actions runs the same locked build checks on pushes and pull requests. This is a compile-time smoke test only: it does not call the Rialo faucet, submit transactions, deploy Venus programs, or require DevNet credentials.

## Notes

There may be rough edges here.

This repository is intentionally a record of me learning the tooling, not a production application or an example of best-practice Rust development.

One useful lesson already: some examples and documentation I found didn't exactly match Rialo 0.18.1, so I ended up looking directly through the installed crate sources to understand the current Venus DSL.

## Environment

- Windows 11
- WSL2 / Ubuntu
- Rust
- Rialo CLI 0.18.1
- Rialo CDK 0.18.1
- Rialo Venus 0.18.1

## Security

DevNet only.

No seed phrases, private keys or production credentials should ever be committed here.

## Why this repo exists

Mostly curiosity.

I'm learning what Rialo can do and documenting the experiments that actually worked.
