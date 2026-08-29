# DevNet Info

This was my first attempt at talking to Rialo DevNet from Rust.

Nothing complicated here: the program connects through Rialo CDK and asks the network for its current block height.

## Run

```bash
cargo run
```

Example:

```text
Connecting to Rialo DevNet...
Connected successfully.
Rialo DevNet block height: 4870796
```

Obviously the block height will be different each time.

## Why I made this

Before trying transactions or Venus programs I wanted the smallest possible test that proved my Rust code could actually communicate with Rialo DevNet.

It worked, so I moved on to the next experiment.
