# PyWin

PyWin is a CLI for managing Python environments in a Wine prefix.

## Usage

`pywin <option>`

Option           | Description
:--------------- | :----------
`-t`, `terminal` | Open PyWin in Linux terminal
`-c`, `console`  | Open PyWin in Wine console
`-w`, `wcfg`     | Run winecfg for PyWin prefix
`-h`, `help`     | Display this help message

Once PyWin is loaded, use the `pve` command to load the default Python virtual environment or run with one of the options listed below.

`pve <option>`

Option     | Description
:--------- | :----------
`-l`       | List available python environments
`-a <env>` | Activate selected environment
`-d`       | Deactivate loaded environment
`-r <env>` | Remove selected environment

## Installation

Run the `installer.sh` script to install PyWin. Running `installer.sh` with the `-u` flag will uninstall PyWin.

The installer will:

- Create a Wine prefix (default: `$HOME/.pywin/pfx`).
- Create a Python environment directory (default: `$HOME/.pywin/venv`).
- Install [Python 3.11.1](https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe) to Wine prefix.
	+ **Required Options:**
      - Add python.exe to PATH
      - pip
      - tcl/tk and IDLe
- Install [NSIS 3.08](https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe) to Wine prefix (*Optional: necessary for compiling with pynsist*).
  + **Required Options:**
      - User Interfaces
      - Graphics
      - Tools
      - Plugins
  + It is not recommended to run application after installation is complete.
