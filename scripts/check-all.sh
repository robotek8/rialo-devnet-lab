#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

examples=(
  "examples/devnet-info"
  "examples/devnet-transfer"
  "examples/venus-counter"
)

failures=0

printf 'Rialo DevNet Lab build smoke check\n'
printf 'Rust: %s\n' "$(rustc --version)"
printf 'Cargo: %s\n\n' "$(cargo --version)"

for example in "${examples[@]}"; do
  manifest="$ROOT_DIR/$example/Cargo.toml"

  if [[ ! -f "$manifest" ]]; then
    printf '[FAIL] %s: Cargo.toml not found\n' "$example"
    failures=$((failures + 1))
    continue
  fi

  printf '==> %s\n' "$example"

  if cargo check --locked --manifest-path "$manifest"; then
    printf '[OK]   %s\n\n' "$example"
  else
    printf '[FAIL] %s\n\n' "$example"
    failures=$((failures + 1))
  fi
done

if (( failures > 0 )); then
  printf 'Build smoke check failed for %d example(s).\n' "$failures"
  exit 1
fi

printf 'All %d examples passed cargo check --locked.\n' "${#examples[@]}"
