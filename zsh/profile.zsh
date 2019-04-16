export PATH="/usr/local/bin:$PATH"

# Set vim as default editor
export EDITOR=$(which vim)

# zsh-autosuggestions configuration
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=true

# Set format date-time to history of commands
export HISTTIMEFORMAT="%d/%m/%y %T "

# Set configuration to Spaceship-prompt
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_DIR_LOCK_SYMBOL=" 🔒"
export SPACESHIP_DIR_TRUNC=4

# Workaround to git stash/pyenv problem https://github.com/pyenv/pyenv/issues/690
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

# NVM Configuration
export NVM_LAZY_LOAD=true

# Pyenv configuration
# Based on https://github.com/davidparsson/zsh-pyenv-lazy/blob/master/pyenv-lazy.plugin.zsh
# Try to find pyenv, if it's not on the path
# export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
# if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    # export PATH="${PYENV_ROOT}/bin:${PATH}"
# fi

# # Lazy load pyenv
# if type pyenv > /dev/null; then
    # export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    # function pyenv() {
        # unset -f pyenv
        # eval "$(command pyenv init -)"
        # eval "$(command pyenv virtualenv-init -)"
        # pyenv $@
    # }
# fi

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Profiling zsh start up
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
