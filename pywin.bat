@echo off

set SCRIPT_DIR=%~dp0
call %SCRIPT_DIR%\config.bat
set VDIR=%PROFILE_DIR%\venv
set VENV=%VDIR%\default
set OPT1=%1
set OPT2=%2

if "%OPT1%"=="" (
  echo ## Default virtual environment
  goto initalize
)

if "%OPT1%"=="-l" (
  echo ## PyWin Environments
  dir /A:D /B %VDIR%
  exit /b
)

if "%OPT1%"=="-p" (
  set VENV=%VDIR%\%OPT2%
  echo ## %OPT2% virtual environment
  goto initalize
) 

if "%OPT1%"=="-r" (
  set VENV=%VDIR%\%OPT2%
  goto remove
)

:initalize
if exist %VENV% (
  echo ### Loading virtual environment
  goto activate
) else (
  echo ### Creating Virtual Environment
  python -m venv %VENV%
  call %VENV%\Scripts\activate
  python -m pip install --upgrade pip
  goto activate
)

:remove
if exist %VENV% (
  echo ## Deleting %OPT2% virtual environment
  rmdir /s %VENV%
  exit /b
) else (
  echo ## %OPT2% environment not found
  exit /b
)

:activate
  call %VENV%\Scripts\activate
