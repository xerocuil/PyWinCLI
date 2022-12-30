# PyWin

CLI manager for Python/Wine.

## Usage

`pywin <option>`

Option     | Description
:--------- | :----------
`-t`       | Open PyWin in Linux terminal
`-c`       | Open PyWin in Wine console
`-h`       | Display this help message

Once PyWin is loaded, use pve to load a python virtual environment

`pve <option>`

Option     | Description
:--------- | :----------
`-l`       | List available python environments
`-a <env>` | Activate selected environment
`-r <env>` | Remove selected environment 

## Installation

On initial run, PyWin will:

- Create a Wine prefix (default: `$HOME/.pywin/pfx`).
- Create a Python environment (default: `$HOME/.pywin/venv`).
- Install [Python 3.11.1](https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe) to Wine prefix.
	+ **Required Options:**
      - Add python.exe to PATH
      - pip
      - tcl/tk and IDLe
- Install [NSIS 3.08](https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe) to Wine prefix (*Optional: only necessary for compiling with pynsist*).
  + **Required Options:**
      - User Interfaces
      - Graphics
      - Tools
      - Plugins
  + It is not recommended to run application after installation is complete.
