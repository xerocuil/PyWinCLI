# PyWinCLI

PyWinCLI is a CLI for managing Python environments in a Wine prefix.

## Usage

`pywinc <option>`

Option           | Description
:--------------- | :----------
`-t`, `terminal` | Open PyWinCLI in Linux terminal
`-c`, `console`  | Open PyWinCLI in Wine console
`-w`, `wcfg`     | Run winecfg for PyWinCLI prefix
`-h`, `help`     | Display this help message

Once PyWinCLI is loaded, use the `pve` command to load the default Python virtual environment or run with one of the options listed below.

`pve <option>`

Option     | Description
:--------- | :----------
`-l`       | List available python environments
`-a <env>` | Activate selected environment
`-d`       | Deactivate loaded environment
`-r <env>` | Remove selected environment

## Installation

Run the `installer.sh` script to install PyWinCLI.  
Running `installer.sh` with the `-u` flag will uninstall PyWinCLI.

The installer will:

- Create a Wine prefix (default: `$HOME/.pywinc/pfx`).
- Create a Python environment directory (default: `$HOME/.pywinc/venv`).
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
