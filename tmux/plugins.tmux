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

# One Dark settings
set -g @onedark_date_first true
set -g @onedark_date_format "%A, %b %d"
set -g @onedark_widgets 'CPU #{cpu_percentage} #{cpu_icon}  GPU #{gpu_percentage} #{gpu_icon}  #{free_mem}'
