# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'jonatasleon/tmux-onedark-theme'
set -g @plugin 'Morantron/tmux-fingers'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-urlview'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'odedlaz/tmux-status-variables'

# CPU / GPU Icons
set -g @cpu_low_icon "🤣"
set -g @cpu_medium_icon "🧐"
set -g @cpu_high_icon "🔥"

set -g @gpu_low_icon "🤣"
set -g @gpu_medium_icon "🧐"
set -g @gpu_high_icon "🔥"

# One Dark settings
white="#(tmux show-option -gqv status-fg)"
set -g @onedark_date_first true
set -g @onedark_date_format "%A, %b %d
set -g @onedark_widgets "#(curl http://wttr.in?format=1)  CPU:#{cpu_fg_color}#{cpu_percentage} #{cpu_icon}#[fg=$white]  GPU:#{gpu_fg_color}#{gpu_percentage} #{gpu_icon}#[fg=$white]  MEM:#{free_mem}"
