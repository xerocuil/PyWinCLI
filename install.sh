#! /bin/bash

# PyWin installer

## Global variables
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/pywin.sh"
CMD=$1

## Functions

### Install PyWin
install()(
  #### Create profile directory
  mkdir -p "$TMPDIR"
  mkdir -p "$VENV"
  cd "$TMPDIR"

  #### Create Win 10/64-bit wine prefix
  winetricks -q mimeassoc=off win10

  #### Install Python 3.11.1 (64-Bit)
  wget "https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe"
  if [[ -f python-3.11.1-amd64.exe ]]; then
    wine python-3.11.1-amd64.exe
  else
    echo "Please download python-3.11.1-amd64.exe to this directory."
  fi

  #### Install NSIS 3.08
  wget "https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe"
  if [[ -f nsis-3.08-setup.exe ]]; then
    wine nsis-3.08-setup.exe
  else
    echo "Please download nsis-3.08-setup.exe to this directory."
  fi

  #### Install scripts
  mkdir -p "$SCRIPTS"
  cp -rv "$SCRIPT_DIR/pve.bat" "$SCRIPTS/"
  ln -s "$SCRIPT_DIR/pywin.sh" "$HOME/.local/bin/pywin"
  rm -rf "$TMPDIR"
)

### Uninstall PyWin
uninstall(){
  rm -rf "$PROFILE_DIR"  "$HOME/.local/bin/pywin" "$SCRIPT_DIR"
}

if [[ -z $CMD ]]; then
  install
else
  $CMD
fi
