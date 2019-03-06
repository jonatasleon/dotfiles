source $HOME/.checkdep.zsh
source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo.
antigen bundles <<EOBUNDLES
    bundler
    docker
    docker-compose
    git
    nvm
    pyenv
    rvm
    sudo
    svn
    tmux
    virtualenv
EOBUNDLES

# Bundles from custom repos.
antigen bundles <<EOBUNDLES
    MichaelAquilina/zsh-you-should-use
    chrissicool/zsh-256color
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

# Theme to use.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# zsh-autosuggestions configuration
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=true
bindkey "^ " autosuggest-accept
bindkey "^U" backward-kill-line

source $HOME/.profile.zsh
