#!/bin/bash

# ============================================================
# Clone OpenVINO repository
# ============================================================

# Get parent directory (this script is in linux subfolder)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

REPO_URL="https://github.com/openvinotoolkit/openvino.git"
REPO_DIR="$ROOT/openvino"

if [ -d "$REPO_DIR" ]; then
    echo ""
    echo "=========================================="
    echo "  OpenVINO already exists at:"
    echo "  $REPO_DIR"
    echo "=========================================="
    echo ""
    read -p "Do you want to delete and re-clone? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
    echo "Removing existing repository..."
    rm -rf "$REPO_DIR"
fi

echo ""
echo "=========================================="
echo "  Cloning OpenVINO..."
echo "=========================================="
echo "  URL: $REPO_URL"
echo "  Dir: $REPO_DIR"
echo "=========================================="
echo ""

git clone --recursive "$REPO_URL" "$REPO_DIR"

if [ $? -ne 0 ]; then
    echo ""
    echo "=========================================="
    echo "  ERROR: Clone failed"
    echo "=========================================="
    exit 1
fi

echo ""
echo "=========================================="
echo "  OpenVINO cloned successfully  ✓"
echo "=========================================="

exit 0
