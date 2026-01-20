# OpenVINO Build Tools

Cross-platform build scripts for OpenVINO and OpenVINO GenAI using Ninja.

Supports both **Windows** and **Linux**.

## Quick Start

### 1. Clone Repositories

**Windows:**
```batch
scripts\clone-all.bat
```

**Linux:**
```bash
./scripts/clone-all.sh
```

Or clone individually:

**Windows:**
```batch
scripts\clone-openvino.bat
scripts\clone-openvino-genai.bat
```

**Linux:**
```bash
./scripts/clone-openvino.sh
./scripts/clone-openvino-genai.sh
```

### 2. Build

**Windows:**
```batch
scripts\ninja-build.bat
```

Build with custom tag for packaging:
```batch
scripts\ninja-build.bat -Tag my-custom-tag
```

**Linux:**
```bash
./scripts/ninja-build.sh
```

Build with specific number of parallel jobs:
```bash
./scripts/ninja-build.sh --jobs 8
```

### 3. Update

Pull latest changes from both repositories:

**Windows:**
```batch
scripts\update-all.bat
```

**Linux:**
```bash
./scripts/update-all.sh
```

## Scripts Overview

All scripts are located in the `scripts/` folder:

| Script | Platform | Description |
|--------|----------|-------------|
| `clone-all.bat/sh` | Win/Linux | Clone both OpenVINO and OpenVINO GenAI repositories |
| `clone-openvino.bat/sh` | Win/Linux | Clone OpenVINO repository only |
| `clone-openvino-genai.bat/sh` | Win/Linux | Clone OpenVINO GenAI repository only |
| `ninja-build.bat/sh` | Win/Linux | Build OpenVINO + GenAI using Ninja and package |
| `ninja-pack.ps1` | Windows | PowerShell script for packaging builds (Windows only) |
| `update-all.bat/sh` | Win/Linux | Update both repositories (git pull) |

## Requirements

### Windows
- Git
- CMake 3.13 or higher
- Ninja
- Visual Studio 2019 or later (with C++ tools)
- Python 3.9-3.12 (optional, for virtual environment)
- ccache (optional, for faster rebuilds)

### Linux
- Git
- CMake 3.13 or higher
- Ninja
- GCC 7.5 or higher
- Python 3.9-3.12 (optional, for virtual environment)
- ccache (optional, for faster rebuilds)

**Install build dependencies on Linux:**
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install -y build-essential cmake ninja-build git python3 python3-pip

# Or use OpenVINO's install script after cloning:
cd openvino
sudo ./install_build_dependencies.sh
```

## Directory Structure

After cloning:
```
ov-build-tools/
├── openvino/              # OpenVINO source
├── openvino.genai/        # OpenVINO GenAI source
└── scripts/               # All build scripts
    ├── clone-all.bat/sh
    ├── clone-openvino.bat/sh
    ├── clone-openvino-genai.bat/sh
    ├── ninja-build.bat/sh
    ├── ninja-pack.ps1     # Windows only
    └── update-all.bat/sh
```

## Platform-Specific Notes

### Windows
- Uses Visual Studio compiler (vcvars64.bat)
- Supports ccache for faster rebuilds (configure path in ninja-build.bat)
- Packages builds as ZIP archives
- Optional: Python virtual environment at `build-env\Scripts\activate.bat`

### Linux
- Uses GCC compiler
- Packages builds as tar.gz archives
- Optional: Python virtual environment at `build-env/bin/activate`
- Make scripts executable: `chmod +x scripts/*.sh`
