@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM --- Root directory (parent of windows folder) ---
set "ROOT=%~dp0.."
if "%ROOT:~-1%"=="\" set "ROOT=%ROOT:~0,-1%"

pushd "%ROOT%" || (
  echo ERROR: Failed to change to root directory
  exit /b 1
)

call :UpdateRepo "openvino" || goto :FAIL
call :UpdateRepo "openvino.genai" || goto :FAIL

echo.
echo ==========================================
echo   All updates completed OK  ^✓
echo ==========================================
endlocal
exit /b 0

:UpdateRepo
set "REPO=%~1"
if not exist "%REPO%\" (
  echo.
  echo ==========================================
  echo   ERROR: Missing folder "%REPO%"
  echo ==========================================
  exit /b 1
)

echo.
echo ==========================================
echo   Updating: %REPO%
echo ==========================================

pushd "%REPO%" || exit /b 1

echo git pull
git pull || (popd & exit /b 1)

popd
echo Done: %REPO%
exit /b 0

:FAIL
echo.
echo ==========================================
echo   Update FAILED. Stopping.
echo ==========================================
popd
endlocal
exit /b 1
