export PATH="/usr/local/bin:$PATH"

# Set vim as default editor
export EDITOR=$(which vim)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
# For a full list of active aliases, run `alias`.
alias zshconfig="$EDITOR ~/.zshrc"
alias vimconfig="$EDITOR ~/.vimrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias profileconfig="$EDITOR ~/.profile.zsh"
alias xopen="xdg-open"
alias hs="history | grep"
alias mkcd='foo() { mkdir -p "$1"; cd "$1" }; foo'
alias update="sudo apt-get update && sudo apt-get upgrade -y"
alias tailf="tail -f"
alias lhalt="ls -halt"
alias lhaltr="ls -haltr"
alias chrome="google-chrome-stable"

# Set format date-time to history of commands
export HISTTIMEFORMAT="%d/%m/%y %T "

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
