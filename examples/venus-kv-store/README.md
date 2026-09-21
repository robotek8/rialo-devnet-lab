# Venus KV Store

A small follow-up to the Venus counter experiment.

The goal is to learn how workflow state behaves when an initiating function
accepts more than one argument and when state is read back later.

## Scope

This first version is deliberately a **single-slot key/value store** rather than
a general-purpose map.

It stores:

```text
present
key
value
revision
```

The key and value are both `u64`. Keeping the state primitive makes this a
small, testable step after `venus-counter` instead of jumping straight into
dynamic collections before the basic state flow is verified on Rialo 0.18.1.

## Operations

### set

```text
set(key, value)
```

Stores the pair and increments `revision`. Setting another pair replaces the
previous slot.

### get

```text
get(key)
```

Checks the current slot. A matching key is reported with `msg!`; a different
key produces a miss.

This is intentionally an observation experiment: `get` does not expose a
traditional synchronous RPC return value.

### clear

Clears the slot and increments `revision`.

## Build

From this directory:

```bash
cargo check --features implementation
```

Then build the PolkaVM artifact:

```bash
cargo build --manifest-path artifact/Cargo.toml
```

The Venus build should generate the WIT interface and manifest under `wit/`.

## Deploy

DevNet only:

```bash
rialo config network switch devnet
rialo client program deploy-venus .
```

Save the returned program ID.

## Invoke

Write a pair:

```bash
rialo client program invoke \
  --program-dir . \
  --function set \
  --arg workflow_pda_slug=random \
  --arg key=7 \
  --arg value=42 \
  <PROGRAM_ID>
```

Read the same key:

```bash
rialo client program invoke \
  --program-dir . \
  --function get \
  --arg workflow_pda_slug=<SAME_WORKFLOW_SLUG> \
  --arg key=7 \
  <PROGRAM_ID>
```

The important part of the DevNet test is to reuse the same workflow state when
checking the stored value. The exact generated manifest is the source of truth
for invocation argument names after the first successful build.

Clear the slot:

```bash
rialo client program invoke \
  --program-dir . \
  --function clear \
  --arg workflow_pda_slug=<SAME_WORKFLOW_SLUG> \
  <PROGRAM_ID>
```

## What this experiment is meant to teach

```text
multiple function arguments
        ↓
workflow state mutation
        ↓
state survives a later invocation
        ↓
read / miss behaviour
        ↓
revision tracking
```

If this primitive version builds and behaves correctly on DevNet, the next
iteration can explore a bounded multi-slot store or collection-shaped state.
