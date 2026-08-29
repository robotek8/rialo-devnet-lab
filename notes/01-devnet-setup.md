# Rialo DevNet Notes

These are notes from my first attempts at using Rialo.

I started with basically no experience with the Rialo developer stack and very little Rust knowledge.

AI assistance helped me work through commands, compiler errors and unfamiliar Rust/Rialo concepts, but I kept the actual experiments small enough that I could follow what was happening.

## Setup

I ended up using:

- Windows 11
- WSL2
- Ubuntu
- Rust / Cargo
- `rialoman`
- Rialo CLI

## First milestone: DevNet

I connected the CLI to DevNet, created test keypairs and requested faucet RLO.

That confirmed the basic environment worked.

## Second milestone: RPC

I wrote a small Rust program using Rialo CDK that queried the current DevNet block height.

Nothing fancy, but it proved I could communicate with the network from my own code.

## Third milestone: transaction

The next example created a temporary wallet, requested faucet RLO and sent a small transaction.

That was my first programmatically submitted Rialo transaction.

## Fourth milestone: Venus

The Venus workflow was where things became much more interesting.

Several attempts failed because of DSL syntax, missing dependencies and implementation-build differences.

Instead of continuing to guess, I inspected the locally installed Rialo 0.18.1 crate sources.

That eventually got the workflow compiling.

From there I managed to:

```text
generate WIT
generate Venus manifest
build PolkaVM artifact
deploy to DevNet
invoke the workflow
```

## Current understanding

I now understand the basic development flow much better than when I started, but I'm still very much learning the details.

Next I want to experiment with things that are actually specific to Rialo instead of only making increasingly complicated test programs.

Possibilities:

- more useful Venus state
- multiple workflow functions
- REX
- external data / HTTP
- automation
- real-world event driven workflows

The point is to understand each new piece as I add it rather than just generating a large project I don't understand.
