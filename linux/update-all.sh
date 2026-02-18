#!/bin/bash

# ============================================================
# Update all submodules (OpenVINO, GenAI, model generator demo)
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$ROOT"

echo ""
echo "=========================================="
echo "  Updating all submodules"
echo "=========================================="
echo ""

git submodule update --init --recursive

echo ""
echo "=========================================="
echo "  All submodules updated  OK"
echo "=========================================="

exit 0
