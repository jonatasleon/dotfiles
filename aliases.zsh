# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
# For a full list of active aliases, run `alias`.
alias chrome="google-chrome-stable"
alias hs="history | grep"
alias lhalt="ls -halt"
alias lhaltr="ls -haltr"
alias mkcd='foo() { mkdir -p "$1"; cd "$1" }; foo'
alias tailf="tail -f"
alias xopen="xdg-open"
alias update="sudo apt-get update && sudo apt-get upgrade -y"
alias updatedotfiles="(cd ~/.dotfiles; git pull --rebase origin master)"
alias updatesnips="(cd ~/.vim/UltiSnips; git pull --rebase origin master)"
alias profileconfig="$EDITOR ~/.dotfiles/profile.zsh"
alias vimconfig="$EDITOR ~/.dotfiles/vimrc"
alias zshconfig="$EDITOR ~/.dotfiles/zshrc"

