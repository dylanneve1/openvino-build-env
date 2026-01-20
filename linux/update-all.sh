#!/bin/bash

# ============================================================
# Update both OpenVINO and OpenVINO GenAI repositories
# ============================================================

# Get parent directory (this script is in linux subfolder)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

update_repo() {
    local REPO="$1"
    
    if [ ! -d "$REPO" ]; then
        echo ""
        echo "=========================================="
        echo "  ERROR: Missing folder \"$REPO\""
        echo "=========================================="
        return 1
    fi
    
    echo ""
    echo "=========================================="
    echo "  Updating: $REPO"
    echo "=========================================="
    
    pushd "$REPO" > /dev/null || return 1
    
    echo "git pull"
    git pull || {
        popd > /dev/null
        return 1
    }
    
    popd > /dev/null
    echo "Done: $REPO"
    return 0
}

cd "$ROOT" || {
    echo "ERROR: Failed to change to root directory"
    exit 1
}

update_repo "openvino" || {
    echo ""
    echo "=========================================="
    echo "  Update FAILED. Stopping."
    echo "=========================================="
    exit 1
}

update_repo "openvino.genai" || {
    echo ""
    echo "=========================================="
    echo "  Update FAILED. Stopping."
    echo "=========================================="
    exit 1
}

echo ""
echo "=========================================="
echo "  All updates completed OK  ✓"
echo "=========================================="

exit 0
