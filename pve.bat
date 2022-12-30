@echo off

rem # pve (PyWinCLI)

rem ## Global variables
set SCRIPT_DIR=%~dp0
set PROFILE_DIR=Z:\home\%USER%\.pywinc
set VDIR=%PROFILE_DIR%\venv
set VENV=%VDIR%\default
set OPT1=%1
set OPT2=%2

rem ## Options

rem ### Default
if "%OPT1%"=="" (
  echo ## Loading default virtual environment
  echo ## Run ^`pve -h^` for more options
  goto initalize
)

rem ### List
if "%OPT1%"=="-l" (
  goto list
)

rem ### Help
if "%OPT1%"=="-h" (
  goto help
)

rem ### Activate
if "%OPT1%"=="-a" (
  set VENV=%VDIR%\%OPT2%
  echo ## Loading %OPT2% virtual environment
  goto initalize
) 

rem ### Deactivate
if "%OPT1%"=="-d" (
  goto deactivate
) 

rem ### Remove
if "%OPT1%"=="-r" (
  set VENV=%VDIR%\%OPT2%
  goto remove
)

rem ## Functions

rem ### Activate environment
:activate
  echo ## Activating...
  call %VENV%\Scripts\activate
  exit /b

rem ### Deactivate environment
:deactivate
  echo ## Deactivating...
  call %VENV%\Scripts\deactivate
  exit /b

rem ### Display help message
:help
echo.
echo pve ^<option^>
echo.
echo Option     ^| Description
echo :--------- ^| :----------
echo -l         ^| List available python environments
echo -a ^<env^>   ^| Activate selected environment
echo -d         ^| Deactivate selected environment
echo -r ^<env^>   ^| Remove selected environment
exit /b

rem ### Initialize virtual environment
:initalize
if exist %VENV% (
  goto activate
) else (
  echo ## Creating...
  python -m venv %VENV%
  call %VENV%\Scripts\activate
  python -m pip install --upgrade pip
  goto activate
)

rem ### List available virtual environments
:list
echo.
echo ## PyWinCLI Environments
echo.
dir /A:D /B %VDIR%
exit /b

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
  