#! /bin/bash

# PyWinCLI

## Manage python environments for wine.

## Global variables
PROFILE_DIR=$HOME/.pywinc
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

### Run Winecfg for prefix
wcfg(){
  winecfg
}

### Open Python prefix in bash terminal
terminal(){
  wine cmd
}

### Open Python prefix in wine console
console(){
  wineconsole
}

help(){
  echo -e "
  pywinc <option>

  Option       | Description
  :----------- | :----------
  -t, terminal | Open PyWinCLI in Linux terminal
  -c, console  | Open PyWinCLI in Wine console
  -w, wcfg     | Run winecfg for PyWinCLI prefix
  -h, help     | Display this help message

  Once PyWinCLI is loaded, use the pve command to load the default Python virtual environment or launch with one of the options listed below.

  pve <option>

  Option   | Description
  :------- | :----------
  -l       | List available python environments
  -a <env> | Activate selected environment
  -d       | Deactivate loaded environment
  -r <env> | Remove selected environment
"
}

## Create environment if missing
if [[ ! -d $PFX ]]; then
  echo -e "\nPlease run PyWinCLI install.sh script.\n"
fi

## Function shortcuts
if [[ -z $CMD ]]; then
  echo -e "\nRun pywinc -h for help.\n"
elif [[ $CMD == "-h" ]]; then
  help
elif [[ $CMD == "-t" ]]; then
  terminal
elif [[ $CMD == "-c" ]]; then
  console
elif [[ $CMD == "-w" ]]; then
  wcfg
else
  $CMD
fi
