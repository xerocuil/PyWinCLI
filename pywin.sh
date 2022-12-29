#! /bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROFILE_DIR=$HOME/.pywin
CONFIG=$SCRIPT_DIR/config.bat
CONFIGTMP=$SCRIPT_DIR/config.txt
TMPDIR=$PROFILE_DIR/tmp

VENV="$PROFILE_DIR/venv"
PFX="$PROFILE_DIR/pfx"
CWD="$(pwd)"
CMD="$1"

export WINEDEBUG=-all
export WINEDLLOVERRIDES=winemenubuilder.exe=d
export WINEPATH="$SCRIPT_DIR"
export WINEPREFIX="$PFX"

cfg(){
  winecfg
}

cmd(){
  wine cmd
}

console(){
  wineconsole
}

## Create config file
create_config(){
  >$CONFIG
  >$CONFIGTMP

  ### Set profile directory
  cd "$PROFILE_DIR"
  wineconsole "$SCRIPT_DIR/wcf.bat" "-d"

  ### Set script directory
  cd "$SCRIPT_DIR"
  wineconsole "$SCRIPT_DIR/wcf.bat" "-d"

  ### Set python version
  wineconsole "$SCRIPT_DIR/wcf.bat" "-v"

  IFS=$'\n'
  CONFIGOPTS=($(cat $CONFIGTMP))
  APP_DIR=$(echo ${CONFIGOPTS[1]} | sed 's/ *$//g')
  
  echo -e "set PROFILE_DIR=${CONFIGOPTS[0]}
set APP_DIR=$APP_DIR
set VERSION=${CONFIGOPTS[2]}" >>$CONFIG
  rm $CONFIGTMP
  cd $CWD
}

## Create environment if missing
if [[ ! -d $PFX ]]; then
  ## Win 10/64-bit wine prefix
  winetricks -q mimeassoc=off win10
  mkdir -p $TMPDIR
  cd $TMPDIR

  ### Install Python 3.11.1 (64-Bit)
  wget https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe
  if [[ -f python-3.11.1-amd64.exe ]]; then
    wine python-3.11.1-amd64.exe
  else
    echo "Please download python-3.11.1-amd64.exe to this directory."
  fi

  ### Install NSIS 3.08
  wget https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe
  if [[ -f nsis-3.08-setup.exe ]]; then
    wine nsis-3.08-setup.exe
  else
    echo "Please download nsis-3.08-setup.exe to this directory."
  fi

  ### Create config file
  create_config
else
  if [[ -d $TMPDIR ]]; then
    rm -rf $TMPDIR
  fi
fi

if [[ -z $CMD ]]; then
  wine cmd
else
  $CMD
fi


## Sofware sources
### -[NSIS 3.08](https://versaweb.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe)
### -[Python 3.11.1](https://www.python.org/ftp/python/3.11.1/python-3.11.1-amd64.exe)
