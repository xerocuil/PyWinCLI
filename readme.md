# PyWin

CLI manager for Python/Wine.

## Usage

pwcli.sh <command>

Command | Description
:------ | :----------
cmd     | Open PyWin in bash terminal
console | Open PyWin in wine console 

## Installation

On initial run, PyWin will:

- Create a Wine prefix (default: `$HOME/.pywin/pfx`)
- Create a Python environment (default: `$HOME/.pywin/venv`)
- Install [Python 3.11.1](https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe)
	+ **Required Options:**
      - Add python.exe to PATH
      - pip
      - tcl/tk and IDLe
- Install [NSIS 3.08](https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe) (*Optional*)
  + Necessary for compiling with pynsist
  + **Required Options:**
      - User Interfaces
      - Graphics
      - Tools
      - Plugins
