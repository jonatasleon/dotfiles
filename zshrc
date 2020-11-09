#!/bin/zsh

source $HOME/.zshenv
source $HOME/.zsh/profile.zsh
source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/functions.zsh

autoload -Uz compinit && compinit
fpath=(~/.zsh/ $fpath)
