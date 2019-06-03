source $HOME/.antigen/antigen.zsh

# load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo.
antigen bundles <<EOBUNDLES
    command-not-found
    docker
    docker-compose
    git
    web-search
    lol
    pyenv
    svn
    tmux
    virtualenv
EOBUNDLES

# Bundles from custom repos.
antigen bundles <<EOBUNDLES
    MichaelAquilina/zsh-you-should-use
    chrissicool/zsh-256color
    lukechilds/zsh-nvm
    zsh-users/zsh-autosuggestions
    zdharma/fast-syntax-highlighting
EOBUNDLES

# Theme to use.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

bindkey "^ " autosuggest-accept
bindkey "^U" backward-kill-line
