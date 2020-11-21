#!/bin/zsh

sdiff() {
  svn diff \"$@\" | colordiff | less -R
}
