@echo off
set SCRIPT_DIR=%~dp0
set CONFIGFILE=%SCRIPT_DIR%config.txt
set OPT1=%1

if "%OPT1%"=="-d" (
  echo ## Setting CWD
  goto set_dir
)

if "%OPT1%"=="-v" (
  echo ## Setting CWD
  goto set_version
)

:set_dir
echo %cd%>>%CONFIGFILE%
exit /b

:set_version
python --version>>%CONFIGFILE%
exit /b