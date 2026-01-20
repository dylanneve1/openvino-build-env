@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM ============================================================
REM Clone OpenVINO repository
REM ============================================================

REM Get parent directory (this script is in scripts subfolder)
set "ROOT=%~dp0.."
if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

set "REPO_URL=https://github.com/openvinotoolkit/openvino.git"
set "REPO_DIR=%ROOT%\openvino"

if exist "%REPO_DIR%\" (
    echo.
    echo ==========================================
    echo   OpenVINO already exists at:
    echo   %REPO_DIR%
    echo ==========================================
    echo.
    choice /C YN /M "Do you want to delete and re-clone"
    if errorlevel 2 goto :END
    if errorlevel 1 (
        echo Removing existing repository...
        rd /s /q "%REPO_DIR%"
    )
)

echo.
echo ==========================================
echo   Cloning OpenVINO...
echo ==========================================
echo   URL: %REPO_URL%
echo   Dir: %REPO_DIR%
echo ==========================================
echo.

git clone --recursive "%REPO_URL%" "%REPO_DIR%"

if %errorlevel% neq 0 (
    echo.
    echo ==========================================
    echo   ERROR: Clone failed
    echo ==========================================
    exit /b 1
)

echo.
echo ==========================================
echo   OpenVINO cloned successfully  ✓
echo ==========================================

:END
endlocal
exit /b 0
