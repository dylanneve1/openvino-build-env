# OpenVINO Windows Build Tools

Build scripts for OpenVINO and OpenVINO GenAI on Windows using Ninja.

## Quick Start

### 1. Clone Repositories

Clone both repositories at once:
```batch
scripts\clone-all.bat
```

Or clone individually:
```batch
scripts\clone-openvino.bat
scripts\clone-openvino-genai.bat
```

### 2. Build

Build OpenVINO and OpenVINO GenAI:
```batch
scripts\ninja-build.bat
```

Build with custom tag for packaging:
```batch
scripts\ninja-build.bat -Tag my-custom-tag
```

Archive only (skip build):
```batch
scripts\ninja-build.bat -ArchiveOnly
```

### 3. Update

Pull latest changes from both repositories:
```batch
scripts\update-all.bat
```

## Scripts Overview

All scripts are located in the `scripts/` folder:

| Script | Description |
|--------|-------------|
| `scripts/clone-all.bat` | Clone both OpenVINO and OpenVINO GenAI repositories |
| `scripts/clone-openvino.bat` | Clone OpenVINO repository only |
| `scripts/clone-openvino-genai.bat` | Clone OpenVINO GenAI repository only |
| `scripts/ninja-build.bat` | Build OpenVINO + GenAI using Ninja and package as ZIP |
| `scripts/ninja-pack.ps1` | PowerShell script for packaging builds |
| `scripts/update-all.bat` | Update both repositories (git pull) |

## Requirements

- Git
- CMake
- Ninja
- Visual Studio (with C++ tools)
- Python (optional, for virtual environment)

## Directory Structure

After cloning:
```
ov-win64-build-tools/
├── openvino/              # OpenVINO source
├── openvino.genai/        # OpenVINO GenAI source
└── scripts/               # All build scripts
    ├── clone-all.bat
    ├── clone-openvino.bat
    ├── clone-openvino-genai.bat
    ├── ninja-build.bat
    ├── ninja-pack.ps1
    └── update-all.bat
```
