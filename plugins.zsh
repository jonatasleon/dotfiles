source $HOME/.antigen/antigen.zsh

# load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo.
antigen bundles <<EOBUNDLES
    docker
    docker-compose
    git
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

bindkey "^ " autosuggest-accept
bindkey "^U" backward-kill-line
