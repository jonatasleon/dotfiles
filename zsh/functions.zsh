#!/bin/zsh

sdiff() {
  svn diff \"$@\" | colordiff | less -R
}

# Profiling zsh start up
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
