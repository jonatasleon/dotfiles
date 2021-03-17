source $HOME/.antigen/antigen.zsh

# load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo.
antigen bundles <<EOBUNDLES
    asdf
    command-not-found
    docker
    docker-compose
    fancy-ctrl-z
    fzf
    git
    svn
    virtualenv
    web-search
EOBUNDLES

# Bundles from custom repos.
antigen bundles <<EOBUNDLES
    MichaelAquilina/zsh-you-should-use
    chrissicool/zsh-256color
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zdharma/fast-syntax-highlighting
EOBUNDLES

# Theme to use.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

compdef vboxmanage=VBoxManage

bindkey "^ " autosuggest-accept
bindkey "^U" backward-kill-line
