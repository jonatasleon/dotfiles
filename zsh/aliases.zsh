# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
# For a full list of active aliases, run `alias`.

# Git-SVN aliases
alias gsf="git svn fetch"

# Make shell easier
alias fd="fdfind"
alias hs="history | grep"
alias kp="ps -ef | tail -n +2 | fzf -m --header='[kill:process]' --reverse --preview=\"echo {} | tr -s ' ' | cut -d' ' -f2 | xargs -I {} ps -p {} -o command\" | awk '{ print \$2 }' | xargs kill -9"
alias kps="ps -ef | tail -n +2 | fzf -m --header='[kill:process]' --reverse --preview=\"echo {} | tr -s ' ' | cut -d' ' -f2 | xargs -I {} ps -p {} -o command\" | awk '{ print \$2 }' | xargs sudo kill -9"
alias mkcd='foo() { mkdir -p "$1"; cd "$1" }; foo'
alias more="less"
alias tailf="tail -f"
alias xopen="xdg-open"

# VBoxManage aliases
alias haltvms="vboxmanage list runningvms | fzf -m --reverse | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} vboxmanage controlvm {} acpipowerbutton"
alias resetvms="vboxmanage list runningvms | fzf -m --reverse | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} vboxmanage controlvm {} reset"
alias runningvms="VBoxManage list runningvms"
alias startvms="VBoxManage list vms | fzf -m --reverse --preview=\"echo {} | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} VBoxManage showvminfo {}\" | sed -E 's/^.*\{(.*)\}$/\1/' | sed -E 's/^.*\{(.*)\}$/\1/' | xargs -I {} vboxmanage startvm {} --type headless"
alias vm=VBoxManage
alias vms="VBoxManage list vms"

# Utils
alias editdotfiles="cd ~/.dotfiles; vim"
alias update="sudo apt-get update && sudo apt-get upgrade -y"
alias updatedotfiles="(cd ~/.dotfiles; git pull --rebase origin master)"
alias updatesnips="(cd ~/.vim/UltiSnips; git pull --rebase origin master)"

# TMUX Aliases
alias base="tmux new -A -s base"
alias sn="tmux new -d -s sshuttle && tmux send-keys -t sshuttle.0 \"sshuttle --dns -r irlanda.dgi.inpe.br 0.0.0.0/0 --exclude 192.168.0.1/24\" ENTER"
alias tsa='tmux new-session -A -s'
alias tssh="tmux-cssh"

# pyenv aliases
alias ac="pyenv activate"
alias activate="pyenv activate"
alias deactivate="pyenv deactivate"
alias shell="pyenv shell"
alias venv="pyenv virtualenv"
alias which="pyenv which"
