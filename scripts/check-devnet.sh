#!/usr/bin/env bash
set -e

echo "=== Rialo DevNet Lab ==="
echo

echo "[1] Rialo CLI"
rialo --version
echo

echo "[2] Stored keypairs"
rialo keytool list
echo

echo "[3] DevNet balance"
rialo client balance
