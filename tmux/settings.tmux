# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind C-a send-prefix

# don't rename windows automatically
set-option -g allow-rename off

# increase repeat-time to 1sec
set-option -g repeat-time 1000

set -g mouse on
