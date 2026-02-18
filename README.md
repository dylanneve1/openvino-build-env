# OpenVINO Build Tools

Cross-platform build scripts for OpenVINO and OpenVINO GenAI using Ninja.

Supports both **Windows** and **Linux**.

## Submodules

This repository uses git submodules for all dependencies:

| Submodule | Description |
|-----------|-------------|
| `openvino/` | OpenVINO toolkit source |
| `openvino.genai/` | OpenVINO GenAI source |
| `npuw.model_generator.demo/` | NPUW synthetic model generator and test suite |

## Quick Start

### Linux - Complete Automated Setup

On a vanilla Linux installation, just run:

```bash
# Clone with submodules
git clone --recursive https://github.com/dylanneve1/openvino-build-env.git
cd openvino-build-env

# Run automated setup (installs dependencies, initializes submodules)
./linux/setup-linux.sh
```

Then build:
```bash
./linux/ninja-build.sh
```

### Windows First-Time Setup

On Windows, ensure you have Visual Studio installed, then:

```batch
REM Clone with submodules
git clone --recursive https://github.com/dylanneve1/openvino-build-env.git
cd openvino-build-env

REM Build
windows\ninja-build.bat
```

## Manual Steps (Advanced Users)

### 1. Initialize Submodules

After cloning, initialize all submodules:

```bash
git submodule update --init --recursive
```

### 2. Build

**Linux:**
```bash
./linux/ninja-build.sh
```

Build with specific number of parallel jobs:
```bash
./linux/ninja-build.sh --jobs 8
```

**Windows:**
```batch
windows\ninja-build.bat
```

Build with custom tag for packaging:
```batch
windows\ninja-build.bat -Tag my-custom-tag
```

**Cross-compile for Windows on Linux:**
```bash
# Install MinGW-w64 first (if not already installed)
sudo apt-get install mingw-w64

# Cross-compile
./linux/ninja-build-windows.sh
```

### 3. Update

Pull latest submodule changes:

**Linux:**
```bash
./linux/update-all.sh
```

**Windows:**
```batch
windows\update-all.bat
```

## Scripts Overview

### Linux Scripts (`linux/`)

| Script | Description |
|--------|-------------|
| `setup-linux.sh` | **ONE-COMMAND SETUP**: Installs dependencies, initializes submodules, prepares everything |
| `ninja-build.sh` | Build OpenVINO + GenAI for Linux and create tar.gz package |
| `ninja-build-windows.sh` | **Cross-compile** for Windows on Linux (using MinGW-w64) |
| `update-all.sh` | Update all submodules |

### Windows Scripts (`windows/`)

| Script | Description |
|--------|-------------|
| `ninja-build.bat` | Build OpenVINO + GenAI using Ninja and create ZIP package |
| `ninja-pack.ps1` | PowerShell script for packaging builds |
| `update-all.bat` | Update all submodules |

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

**Automated installation (RECOMMENDED):**
```bash
./linux/setup-linux.sh
```

## Directory Structure

```
ov-build-tools/
├── linux/                        # Linux build scripts (.sh)
│   ├── setup-linux.sh            # Automated setup (ONE COMMAND!)
│   ├── ninja-build.sh
│   ├── ninja-build-windows.sh
│   └── update-all.sh
├── windows/                      # Windows build scripts (.bat, .ps1)
│   ├── ninja-build.bat
│   ├── ninja-pack.ps1
│   └── update-all.bat
├── openvino/                     # [submodule] OpenVINO source
├── openvino.genai/               # [submodule] OpenVINO GenAI source
└── npuw.model_generator.demo/    # [submodule] NPUW model generator + test suite
```
