source $HOME/.antigen/antigen.zsh
source $HOME/.profile.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo.
antigen bundles <<EOBUNDLES
	git
	pipenv
	pyenv
	virtualenv
	svn
	sudo
	docker-compose
EOBUNDLES

# Bundles from custom repos.
antigen bundles <<EOBUNDLES
	chrissicool/zsh-256color
	MichaelAquilina/zsh-you-should-use
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-autosuggestions
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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

unalias _
