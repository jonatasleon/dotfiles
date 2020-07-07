# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
# For a full list of active aliases, run `alias`.

# Git-SVN aliases
alias gsf="git svn fetch"

# Make shell easier
alias hs="history | grep"
alias lhalt="ls -halt"
alias lhaltr="ls -haltr"
alias mkcd='foo() { mkdir -p "$1"; cd "$1" }; foo'
alias more="less"
alias tailf="tail -f"
alias xopen="xdg-open"
alias kp="ps -ef | fzf -m --header='[kill:process]' | awk '{ print \$2 }' | xargs kill -9"
alias tsa='_tsa() { ts "$1" || ta "$1" }; _tsa'
alias fd='fdfind'

# Utils
alias update="sudo apt-get update && sudo apt-get upgrade -y"
alias updatedotfiles="(cd ~/.dotfiles; git pull --rebase origin master)"
alias updatesnips="(cd ~/.vim/UltiSnips; git pull --rebase origin master)"
alias editdotfiles="cd ~/.dotfiles; vim"

# TMUX Aliases
alias tssh="tmux-cssh"

# pyenv aliases
alias activate="pyenv activate"
alias deactivate="pyenv deactivate"
alias shell="pyenv shell"
alias venv="pyenv virtualenv"
alias which="pyenv which"
