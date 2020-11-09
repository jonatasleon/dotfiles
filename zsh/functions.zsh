#!/bin/zsh

hs() {
    local sels=( "${(@f)$(history | tac | fzf -m | awk '{$1="";print substr($0,2)}')}" )
    [ -n "$sels" ] && print -z -- "${sels[@]:q:q}"
}

sdiff() {
  svn diff \"$@\" | colordiff | less -R
}
