# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind C-a send-prefix

# don't rename windows automatically
set-option -g allow-rename off

# increase repeat-time to 1sec
set-option -g repeat-time 1000

set -g mouse on

# Tmux-yank settings
set -g @yank_with_mouse on
set -g @yank_selection_mouse 'clipboard'

# One Dark settings
set -g @onedark_date_first true
set -g @onedark_date_format "%A, %b %d"
set -g @onedark_time_format '%H:%M'

set -g @fingers-keyboard-layout qwerty-left-homerow
