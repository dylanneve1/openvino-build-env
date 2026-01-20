@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM ============================================================
REM Clone both OpenVINO and OpenVINO GenAI repositories
REM ============================================================

REM Get parent directory (this script is in windows subfolder)
set "ROOT=%~dp0.."
if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

echo.
echo ==========================================
echo   Cloning all repositories
echo ==========================================
echo.

call "%~dp0clone-openvino.bat"
if %errorlevel% neq 0 (
    echo.
    echo ==========================================
    echo   ERROR: Failed to clone OpenVINO
    echo ==========================================
    exit /b 1
)

echo.

call "%~dp0clone-openvino-genai.bat"
if %errorlevel% neq 0 (
    echo.
    echo ==========================================
    echo   ERROR: Failed to clone OpenVINO GenAI
    echo ==========================================
    exit /b 1
)

echo.
echo ==========================================
echo   All repositories cloned successfully  ✓
echo ==========================================

endlocal
exit /b 0
