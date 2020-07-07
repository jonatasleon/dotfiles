#!/bin/zsh

source $HOME/.zshenv
source $HOME/.zsh/checkdep.zsh
source $HOME/.zsh/profile.zsh
source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/aliases.zsh

autoload -Uz compinit && compinit
