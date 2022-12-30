@echo off

rem # PyWin

rem ## Global variables
set SCRIPT_DIR=%~dp0
set PROFILE_DIR=Z:\home\%USER%\.pywin
set VDIR=%PROFILE_DIR%\venv
set VENV=%VDIR%\default
set OPT1=%1
set OPT2=%2

rem ## Options

rem ### Default
if "%OPT1%"=="" (
  echo ## Default virtual environment
  goto initalize
)

rem ### List
if "%OPT1%"=="-l" (
  echo ## PyWin Environments
  dir /A:D /B %VDIR%
  exit /b
)

rem ### Load
if "%OPT1%"=="-p" (
  set VENV=%VDIR%\%OPT2%
  echo ## %OPT2% virtual environment
  goto initalize
) 

rem ### Remove
if "%OPT1%"=="-r" (
  set VENV=%VDIR%\%OPT2%
  goto remove
)

rem ## Functions

rem ### Initialize virtual environment
:initalize
if exist %VENV% (
  echo ### Loading virtual environment
  goto activate
) else (
  echo ### Creating virtual Environment
  python -m venv %VENV%
  call %VENV%\Scripts\activate
  python -m pip install --upgrade pip
  goto activate
)

rem ### Remove selected virtual environment
:remove
if exist %VENV% (
  echo ## Deleting %OPT2% virtual environment
  rmdir /s %VENV%
  exit /b
) else (
  echo ## %OPT2% environment not found
  exit /b
)

rem ### Activate environment
:activate
  call %VENV%\Scripts\activate
  