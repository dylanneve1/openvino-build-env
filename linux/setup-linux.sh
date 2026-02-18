#!/bin/bash

# ============================================================
# Complete automated setup for OpenVINO build environment
# - Installs all required dependencies
# - Clones OpenVINO and OpenVINO GenAI repositories
# - Installs OpenVINO-specific dependencies
# ============================================================

set -e

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo ""
echo "=========================================="
echo "  OpenVINO Build Tools - Linux Setup"
echo "=========================================="
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
    echo "ERROR: Please run as normal user (not root)"
    echo "The script will use sudo when needed"
    exit 1
fi

# Detect Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
    VERSION=$VERSION_ID
else
    echo "ERROR: Cannot detect Linux distribution"
    exit 1
fi

echo "Detected: $PRETTY_NAME"
echo ""

# Install basic build dependencies
case $DISTRO in
    ubuntu|debian)
        echo "=========================================="
        echo "  Step 1/4: Installing build dependencies"
        echo "=========================================="
        sudo apt-get update
        sudo apt-get install -y \
            build-essential \
            cmake \
            ninja-build \
            git \
            wget \
            curl \
            ca-certificates \
            pkg-config \
            python3 \
            python3-pip \
            python3-venv \
            python3-dev \
            libpython3-dev \
            ccache
        ;;
    
    fedora|rhel|centos|rocky|almalinux)
        echo "=========================================="
        echo "  Step 1/4: Installing build dependencies"
        echo "=========================================="
        sudo dnf install -y \
            gcc \
            gcc-c++ \
            cmake \
            ninja-build \
            git \
            wget \
            curl \
            ca-certificates \
            pkgconfig \
            python3 \
            python3-pip \
            python3-devel \
            ccache
        ;;
    
    opensuse*|sles)
        echo "=========================================="
        echo "  Step 1/4: Installing build dependencies"
        echo "=========================================="
        sudo zypper install -y \
            gcc \
            gcc-c++ \
            cmake \
            ninja \
            git \
            wget \
            curl \
            ca-certificates \
            pkg-config \
            python3 \
            python3-pip \
            python3-devel \
            ccache
        ;;
    
    arch|manjaro)
        echo "=========================================="
        echo "  Step 1/4: Installing build dependencies"
        echo "=========================================="
        sudo pacman -Sy --noconfirm \
            base-devel \
            cmake \
            ninja \
            git \
            wget \
            curl \
            ca-certificates \
            pkg-config \
            python \
            python-pip \
            ccache
        ;;
    
    *)
        echo "ERROR: Unsupported distribution: $DISTRO"
        echo "Supported distributions:"
        echo "  - Ubuntu/Debian"
        echo "  - Fedora/RHEL/CentOS/Rocky/AlmaLinux"
        echo "  - openSUSE/SLES"
        echo "  - Arch/Manjaro"
        exit 1
        ;;
esac

# Verify installations
echo ""
echo "Verifying installations..."
command -v cmake >/dev/null 2>&1 && echo "✓ cmake: $(cmake --version | head -n1)" || echo "✗ cmake not found"
command -v ninja >/dev/null 2>&1 && echo "✓ ninja: $(ninja --version)" || echo "✗ ninja not found"
command -v git >/dev/null 2>&1 && echo "✓ git: $(git --version)" || echo "✗ git not found"
command -v gcc >/dev/null 2>&1 && echo "✓ gcc: $(gcc --version | head -n1)" || echo "✗ gcc not found"
command -v g++ >/dev/null 2>&1 && echo "✓ g++: $(g++ --version | head -n1)" || echo "✗ g++ not found"
command -v python3 >/dev/null 2>&1 && echo "✓ python3: $(python3 --version)" || echo "✗ python3 not found"
command -v ccache >/dev/null 2>&1 && echo "✓ ccache: $(ccache --version | head -n1)" || echo "  ccache not found (optional)"

# Initialize submodules
echo ""
echo "=========================================="
echo "  Step 2/4: Initializing submodules"
echo "=========================================="
echo ""

cd "$ROOT"

git submodule update --init --recursive

# Install OpenVINO-specific dependencies
echo ""
echo "=========================================="
echo "  Step 3/4: Installing OpenVINO dependencies"
echo "=========================================="
echo ""

if [ -f "$ROOT/openvino/.deps_installed" ]; then
    echo "OpenVINO dependencies already installed, skipping..."
else
    cd "$ROOT/openvino"
    if [ -f "./install_build_dependencies.sh" ]; then
        echo "Running OpenVINO dependency installer..."
        sudo ./install_build_dependencies.sh
        touch .deps_installed
        echo "✓ OpenVINO dependencies installed"
    else
        echo "WARNING: install_build_dependencies.sh not found"
        echo "You may need to install additional dependencies manually"
    fi
    cd "$ROOT"
fi

echo ""
echo "=========================================="
echo "  Step 4/4: Setup complete!"
echo "=========================================="
echo ""
echo "Your system is ready to build OpenVINO!"
echo ""
echo "Next step:"
echo "  ./linux/ninja-build.sh"
echo ""

exit 0
