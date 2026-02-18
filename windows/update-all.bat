@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM ============================================================
REM Update all submodules (OpenVINO, GenAI, model generator demo)
REM ============================================================

REM --- Root directory (parent of windows folder) ---
set "ROOT=%~dp0.."
if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

pushd "%ROOT%" || (
  echo ERROR: Failed to change to root directory
  exit /b 1
)

echo.
echo ==========================================
echo   Updating all submodules
echo ==========================================
echo.

git submodule update --init --recursive
if %errorlevel% neq 0 (
  echo.
  echo ==========================================
  echo   Update FAILED.
  echo ==========================================
  popd
  endlocal
  exit /b 1
)

echo.
echo ==========================================
echo   All submodules updated  OK
echo ==========================================

popd
endlocal
exit /b 0
