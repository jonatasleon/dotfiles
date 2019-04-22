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

# Add file to gitignore global
git config --global core.excludesfile $HOME/.gitignore_global

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Profiling zsh start up
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
