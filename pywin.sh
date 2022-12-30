#! /bin/bash

# PyWin

## Manage python environments for wine.

## Global variables
PROFILE_DIR=$HOME/.pywin
SCRIPTS=$PROFILE_DIR/scripts
TMPDIR=$PROFILE_DIR/tmp
VENV="$PROFILE_DIR/venv"
PFX="$PROFILE_DIR/pfx"
CWD="$(pwd)"
CMD="$1"

## Wine settings
export WINEDEBUG=-all
export WINEDLLOVERRIDES=winemenubuilder.exe=d
export WINEPATH="$SCRIPTS"
export WINEPREFIX="$PFX"

## Functions
### Winecfg
cfg(){
  winecfg
}

### Open Python prefix in bash terminal
cmd(){
  wine cmd
}

### Open Python prefix in wine console
console(){
  wineconsole
}

help(){
  echo -e "
  pywin <option>

  Option   | Description
  :------- | :----------
  -t       | Open PyWin in Linux terminal
  -c       | Open PyWin in Wine console
  -h       | Display this help message

  Once PyWin is loaded, use pve to load a python virtual environment:

  pve <option>

  Option   | Description
  :------- | :----------
  -l       | List available python environments
  -a <env> | Activate selected environment
  -r <env> | Remove selected environment 
  "
}

## Create environment if missing
if [[ ! -d $PFX ]]; then
  echo -e "Please run install.sh script."
fi

## Run wine cmd if no command given
if [[ -z $CMD ]]; then
  echo -e "\nRun pywin -h for help.\n"
elif [[ $CMD == "-h" ]]; then
  help
elif [[ $CMD == "-t" ]]; then
  cmd
elif [[ $CMD == "-c" ]]; then
  console
fi
