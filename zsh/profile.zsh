export PATH="/usr/local/bin:$HOME/.local/bin:$PATH"

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

export SPACESHIP_PYENV_SYMBOL=" "
export SPACESHIP_PYENV_COLOR="blue"

export SPACESHIP_RUBY_SYMBOL=" "

export SPACESHIP_CONDA_COLOR="yellow"

export SPACESHIP_VENV_PREFIX="venv:("
export SPACESHIP_VENV_SUFFIX=") "

export SPACESHIP_EXIT_CODE_SHOW=true

# Workaround to git stash/pyenv problem https://github.com/pyenv/pyenv/issues/690
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

# NVM Configuration
export NVM_LAZY_LOAD=false

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export LESS="-R"
export LESSOPEN="|~/.lessfilter %s"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add file to gitignore global
git config --global core.excludesfile $HOME/.gitignore_global

# Profiling zsh start up
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

texactivate() {
    mkdir -p $HOME/.texenv
    export TEXMFHOME=$HOME/.texenv
}

texdeactivate() {
    unset TEXMFHOME
}
