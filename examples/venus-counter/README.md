# Rialo Venus Counter

A minimal stateful Venus workflow deployed and invoked on Rialo DevNet.

## What it does

The program stores a `counter` value.

The `start` function accepts an amount and adds it to the counter.

## Workflow

```rust
initiating fn start(&mut self, amount: u64) -> ProgramResult {
    self.counter += amount;
    Ok(())
}
