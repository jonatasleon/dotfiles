# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
# For a full list of active aliases, run `alias`.

alias cat="bat"
alias ls="exa"
alias top="ytop"
alias nord="nordvpn"

# Git-SVN aliases
alias gsf="git svn fetch"
alias gnvm="git reset --soft HEAD~1"

# Make shell easier
alias fd="fdfind"
alias hs="history | grep"
alias mkcd='foo() { mkdir -p "$1"; cd "$1" }; foo'
alias more="less"
alias tailf="tail -f"
alias xopen="xdg-open"
alias kp="ps -ef | tail -n +2 | fzf -m --header='[kill:process]' --reverse --preview=\"echo {} | tr -s ' ' | cut -d' ' -f2 | xargs -I {} ps -p {} -o command\" | awk '{ print \$2 }' | xargs kill -9"
alias kps="ps -ef | tail -n +2 | fzf -m --header='[kill:process]' --reverse --preview=\"echo {} | tr -s ' ' | cut -d' ' -f2 | xargs -I {} ps -p {} -o command\" | awk '{ print \$2 }' | xargs sudo kill -9"

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
alias myip="curl https://ipinfo.io/ip"
alias sad="ssh-add"

# TMUX Aliases
alias ts="tmux new-session -s"
alias tsa="tmux new-session -A -s"
alias tl="tmux list-sessions"
alias ta="tmux attach-session -t"
alias tA="tmux attach"
alias tkss="tmux kill-session -t"

alias tssh="tmux-cssh"
