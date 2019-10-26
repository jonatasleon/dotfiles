# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
# For a full list of active aliases, run `alias`.
alias chrome="google-chrome-stable"
alias fun="ts $(whoami) || ta $(whoami)"
alias gsf="git svn fetch"
alias hs="history | grep"
alias lhalt="ls -halt"
alias lhaltr="ls -haltr"
alias mkcd='foo() { mkdir -p "$1"; cd "$1" }; foo'
alias mknote="touch note_$(date +%Y%m%d).md"
alias more="less"
alias profileconfig="$EDITOR ~/.dotfiles/profile.zsh"
alias tailf="tail -f"
alias update="sudo apt-get update && sudo apt-get upgrade -y"
alias updatedotfiles="(cd ~/.dotfiles; git pull --rebase origin master)"
alias updatesnips="(cd ~/.vim/UltiSnips; git pull --rebase origin master)"
alias vim="nvim"
alias vimconfig="$EDITOR ~/.dotfiles/config/nvim/init.vim"
alias xopen="xdg-open"
alias zshconfig="$EDITOR ~/.dotfiles/zshrc"

# pyenv aliases
alias venv="pyenv virtualenv"
alias activate="pyenv activate"
alias deactivate="pyenv deactivate"
alias shell="pyenv shell"
alias which="pyenv which"
