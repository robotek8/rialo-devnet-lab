# Venus Counter

My first experiment with a stateful Rialo Venus workflow.

This took more trial and error than the previous examples.

I am still learning how Venus works, so this is intentionally a very small program.

## Idea

The workflow contains one value:

```text
counter
```

and one initiating function that adds a number to it.

```rust
initiating fn start(&mut self, amount: u64) -> ProgramResult {
    self.counter += amount;
    Ok(())
}
```

## What happened while building it

The first versions didn't compile.

The installed Rialo 0.18.1 crates turned out to be more useful than guessing from examples, so I looked through the local Venus DSL sources to understand the expected structure.

One important detail was that the DSL expected:

```rust
rialo! {
    workflow {
        ...
    }
}
```

rather than putting `state` directly under `rialo!`.

There were also a few dependency and macro issues that only appeared when building the implementation / PolkaVM artifact.

Eventually the full flow worked.

## Build

Check the implementation:

```bash
cargo check --features implementation
```

Build the deployment artifact:

```bash
cargo build --manifest-path artifact/Cargo.toml
```

Venus generates the WIT interface and manifest under:

```text
wit/
```

The PolkaVM build output is generated under:

```text
target/rialo-build/
```

## Deploy

```bash
rialo client program deploy-venus .
```

The program successfully deployed to Rialo DevNet.

## Invoke

I invoked the `start` function with:

```bash
rialo client program invoke \
  --program-dir . \
  --function start \
  --arg workflow_pda_slug=random \
  --arg amount=5 \
  <PROGRAM_ID>
```

That produced a confirmed DevNet transaction.

## What I learned

This experiment helped me understand the rough path from source code to something actually running on Rialo:

```text
Rust / Venus DSL
      ↓
WIT + manifest
      ↓
PolkaVM
      ↓
DevNet deployment
      ↓
on-chain invocation
```

I definitely don't understand every part of Venus yet.

That's the reason this repo exists.
