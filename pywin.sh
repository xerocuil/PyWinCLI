#! /bin/bash

# PyWin

## Manage python environments for wine.

## Global variables
PROFILE_DIR=$HOME/.pywin
SCRIPTS=$PROFILE_DIR/scripts
TMPDIR=$PROFILE_DIR/tmp
VENV="$PROFILE_DIR/venv"
PFX="$PROFILE_DIR/pfx"
CONFIG=$SCRIPTS/config.bat
CONFIGTMP=$SCRIPTS/config.txt
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
  pwcli.sh <command>

  Command | Description
  ------- | -----------
  cmd     | Open PyWin in bash terminal
  console | Open PyWin in wine console 
  "
}

## Create environment if missing
if [[ ! -d $PFX ]]; then
  echo -e "Please run install.sh script."
fi

## Run `wine cmd` if no command given
if [[ -z $CMD ]]; then
  help
else
  $CMD
fi
