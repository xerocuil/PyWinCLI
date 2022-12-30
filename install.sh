#! /bin/bash

# PyWin installation

## Sofware sources
### -[NSIS 3.08](https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe)
### -[Python 3.11.1](https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe)

## Global variables
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/pwcli.sh"

### Create Win 10/64-bit wine prefix
winetricks -q mimeassoc=off win10
mkdir -p "$TMPDIR"
cd "$TMPDIR"

### Install Python 3.11.1 (64-Bit)
wget "https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe"
if [[ -f python-3.11.1-amd64.exe ]]; then
  wine python-3.11.1-amd64.exe
else
  echo "Please download python-3.11.1-amd64.exe to this directory."
fi

### Install NSIS 3.08
wget "https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe"
if [[ -f nsis-3.08-setup.exe ]]; then
  wine nsis-3.08-setup.exe
else
  echo "Please download nsis-3.08-setup.exe to this directory."
fi

### Install scripts
mkdir -p "$SCRIPTS"
cp -rv "$SCRIPT_DIR/pywin.bat" "$SCRIPT_DIR/wcf.bat" "$SCRIPTS/"
ln -s "$SCRIPT_DIR/pwcli.sh" "$HOME/.local/bin/pwcli"
rm -rf "$TMPDIR"
