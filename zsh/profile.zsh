#!/bin/zsh

# Add local bins to PATH
export PATH="/usr/local/bin:$HOME/.local/bin:$PATH"

export XDG_DATA_HOME=$HOME/.local/share

# Add scripts dir to path
export CUSTOM_SCRIPTS_DIR="${HOME}/.scripts"
[ -d "${CUSTOM_SCRIPTS_DIR}" ] && PATH="${PATH}:${CUSTOM_SCRIPTS_DIR}"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_HOME=$HOME/.android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set vim as default editor
export EDITOR=$(which vim)

# zsh-autosuggestions configuration
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=true

# Set format date-time to history of commands
export HISTTIMEFORMAT="%d/%m/%y %T "

# Set configuration to Spaceship-prompt
export SPACESHIP_CHAR_SYMBOL="-> "

export SPACESHIP_TIME_SHOW=true
export SPACESHIP_DIR_LOCK_SYMBOL=" "
export SPACESHIP_DIR_TRUNC=4

export SPACESHIP_CONDA_COLOR="yellow"

export SPACESHIP_VENV_PREFIX="venv:("
export SPACESHIP_VENV_SUFFIX=") "

export SPACESHIP_EXIT_CODE_SHOW=true
export SPACESHIP_EXIT_CODE_PREFIX="("
export SPACESHIP_EXIT_CODE_SUFFIX=") "

export WORKON_HOME=~/.envs
mkdir -p $WORKON_HOME
source $(asdf which virtualenvwrapper.sh)

# Load secrets
[ -f $HOME/.vault ] && source $HOME/.vault

# Add file to gitignore global
git config --global core.excludesfile $HOME/.gitignore_global
