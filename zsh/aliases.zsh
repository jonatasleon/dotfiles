# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
# For a full list of active aliases, run `alias`.

# Git-SVN aliases
alias gsf="git svn fetch"

alias sdiff="_sdiff() { svn diff \"$@\" | colordiff | less -R }; _sdiff"

# Make shell easier
alias mkcd='foo() { mkdir -p "$1"; cd "$1" }; foo'
alias more="less"
alias tailf="tail -f"
alias xopen="xdg-open"
alias tsa='_tsa() { ts "$1" || ta "$1" }; _tsa'
alias fd='fdfind'
alias kp="ps -ef | tail -n +2 | fzf -m --header='[kill:process]' --reverse --preview=\"echo {} | tr -s ' ' | cut -d' ' -f2 | xargs -I {} ps -p {} -o command\" | awk '{ print \$2 }' | xargs kill -9"
alias kps="ps -ef | tail -n +2 | fzf -m --header='[kill:process]' --reverse --preview=\"echo {} | tr -s ' ' | cut -d' ' -f2 | xargs -I {} ps -p {} -o command\" | awk '{ print \$2 }' | xargs sudo kill -9"
alias hs="history | fzf"

# VBoxManage aliases
alias vm=VBoxManage
alias startvms="VBoxManage list vms | fzf -m --reverse --preview=\"echo {} | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} VBoxManage showvminfo {}\" | sed -E 's/^.*\{(.*)\}$/\1/' | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} vboxmanage startvm {} --type headless"
alias haltvms="vboxmanage list runningvms | fzf -m --reverse | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} vboxmanage controlvm {} acpipowerbutton"
alias resetvms="vboxmanage list runningvms | fzf -m --reverse | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} vboxmanage controlvm {} reset"
alias vms="VBoxManage list vms"
alias runningvms="VBoxManage list runningvms"

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
