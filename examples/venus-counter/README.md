# Rialo Venus Counter

A minimal stateful Venus workflow built, deployed and invoked on Rialo DevNet.

## What it does

The workflow stores a `counter` value.

Its initiating function accepts an amount and adds that value to the counter.

```rust
initiating fn start(&mut self, amount: u64) -> ProgramResult {
    self.counter += amount;
    Ok(())
}
```

## Venus Workflow

The project uses the Rialo Venus DSL:

```rust
rialo! {
    workflow {
        state {
            counter: u64,
        }

        program {
            use rialo_s_program::{
                entrypoint::ProgramResult,
                msg,
            };

            initiating fn start(&mut self, amount: u64) -> ProgramResult {
                self.counter += amount;
                Ok(())
            }
        }
    }
}
```

During compilation Venus generates:

```text
wit/rialo-venus-counter.wit
wit/rialo-venus-counter-manifest.json
```

## Build

Check the workflow:

```bash
cargo check --features implementation
```

Build the PolkaVM deployment artifact:

```bash
cargo build --manifest-path artifact/Cargo.toml
```

The resulting PolkaVM binary is generated under:

```text
target/rialo-build/
```

## Deploy to DevNet

```bash
rialo client program deploy-venus .
```

Successful DevNet deployment:

```text
Program ID:
2fLrxQyQABAzhPoKn2iTRrYSSsovrT7hC6uBonbD5o35
```

## Invoke

The workflow requires a nonce for `workflow_pda_slug`.

The Rialo CLI can generate one automatically using `random`.

```bash
rialo client program invoke \
  --program-dir . \
  --function start \
  --arg workflow_pda_slug=random \
  --arg amount=5 \
  2fLrxQyQABAzhPoKn2iTRrYSSsovrT7hC6uBonbD5o35
```

Successful invocation produced an on-chain transaction:

```text
52qGRvvye6ubzaqNDgPCj7SZH6SC4aiesWiiMsav3TDYe5mbEGLB1fpLqh7guQtBCPXH1ksa4rw8ZQJrWkshyrZe
```

## Stack

- Rust
- Rialo Venus 0.18.1
- Rialo CLI 0.18.1
- Rialo S Program 0.18.1
- PolkaVM
- Rialo DevNet

## Status

- Workflow compiled
- WIT generated
- Venus manifest generated
- PolkaVM artifact built
- Program deployed to DevNet
- `start` successfully invoked on-chain
