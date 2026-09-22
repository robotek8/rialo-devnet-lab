#!/usr/bin/env bash
set -u

echo "=== Rialo DevNet healthcheck ==="
echo

failures=0
warnings=0

run_check() {
  local label="$1"
  shift
  local output
  local status

  printf '%-24s' "$label"
  output="$("$@" 2>&1)"
  status=$?

  if (( status == 0 )); then
    echo "OK"
    [[ -n "$output" ]] && printf '%s\n' "$output" | sed 's/^/  /'
  else
    echo "FAIL"
    printf '%s\n' "$output" | sed 's/^/  /'
    failures=$((failures + 1))
  fi
  echo
}

warn_check() {
  local label="$1"
  shift
  local output
  local status

  printf '%-24s' "$label"
  output="$("$@" 2>&1)"
  status=$?

  if (( status == 0 )); then
    echo "OK"
    [[ -n "$output" ]] && printf '%s\n' "$output" | sed 's/^/  /'
  else
    echo "WARN"
    printf '%s\n' "$output" | sed 's/^/  /'
    warnings=$((warnings + 1))
  fi
  echo
}

if ! command -v rialo >/dev/null 2>&1; then
  echo "Rialo CLI               FAIL"
  echo "  rialo was not found in PATH"
  echo
  echo "Summary: 1 failure, 0 warnings"
  exit 1
fi

run_check "Rialo CLI" rialo --version
warn_check "Stored keypairs" rialo keytool list
run_check "DevNet balance" rialo client balance

echo "Summary: $failures failure(s), $warnings warning(s)"
(( failures == 0 ))
