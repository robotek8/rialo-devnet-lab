# 02 — Venus state: from counter to key/value

The counter proved that a small piece of workflow state can be mutated by an
initiating function and deployed to DevNet.

The next question is more practical:

> Can one invocation write structured state and a later invocation observe it?

The `venus-kv-store` experiment keeps that question intentionally narrow. It
uses primitive fields — a `bool`, two `u64` values and a revision counter —
instead of immediately assuming that a dynamic Rust map is a supported or
appropriate Venus state representation.

That gives the experiment three useful checks:

1. a function with multiple arguments can update workflow state;
2. another invocation can compare a requested key with stored state;
3. a revision counter makes repeated mutations visible.

The first implementation is single-slot on purpose. Expanding it should happen
only after the generated WIT/manifest and an actual DevNet invocation confirm
the state semantics.
