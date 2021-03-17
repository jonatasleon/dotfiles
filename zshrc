#!/bin/zsh
# zmodload zsh/zprof

source $HOME/.zsh/profile.zsh
source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/functions.zsh

fpath=(~/.zsh/ $fpath)
fpath=($fpath ~/.zsh/completion)
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# zprof
