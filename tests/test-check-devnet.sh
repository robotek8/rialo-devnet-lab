#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHECK="$ROOT/scripts/check-devnet.sh"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

make_rialo() {
  cat >"$TMP/rialo" <<'MOCK'
#!/usr/bin/env bash
case "$*" in
  "--version") echo "rialo 0.18.1"; exit "${MOCK_VERSION_RC:-0}" ;;
  "keytool list") echo "test-key"; exit "${MOCK_KEYTOOL_RC:-0}" ;;
  "client balance") echo "1 RLO"; exit "${MOCK_BALANCE_RC:-0}" ;;
  *) exit 2 ;;
esac
MOCK
  chmod +x "$TMP/rialo"
}

assert_contains() {
  grep -Fq "$2" "$1" || { echo "missing: $2"; cat "$1"; exit 1; }
}

make_rialo
PATH="$TMP:$PATH" "$CHECK" >"$TMP/ok"
assert_contains "$TMP/ok" "Summary: 0 failure(s), 0 warning(s)"

set +e
PATH="$TMP:$PATH" MOCK_KEYTOOL_RC=1 "$CHECK" >"$TMP/warn"
rc=$?
set -e
[[ $rc -eq 0 ]]
assert_contains "$TMP/warn" "Stored keypairs         WARN"
assert_contains "$TMP/warn" "Summary: 0 failure(s), 1 warning(s)"

set +e
PATH="$TMP:$PATH" MOCK_BALANCE_RC=1 "$CHECK" >"$TMP/fail"
rc=$?
set -e
[[ $rc -eq 1 ]]
assert_contains "$TMP/fail" "DevNet balance          FAIL"
assert_contains "$TMP/fail" "Summary: 1 failure(s), 0 warning(s)"
assert_contains "$TMP/fail" "Rialo CLI               OK"

echo "healthcheck tests: OK"
