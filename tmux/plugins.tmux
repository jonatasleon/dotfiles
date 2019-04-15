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

# Variables
fg_color="#(tmux show-option -gqv status-fg)"
cpu_format="CPU:#{cpu_fg_color}#{cpu_percentage} #{cpu_icon}#[fg=$fg_color]"
gpu_format="GPU:#{gpu_fg_color}#{gpu_percentage} #{gpu_icon}#[fg=$fg_color]"
mem_format="#{free_mem}"
battery_format="#{battery_status_fg}#{battery_icon}#{battery_percentage}#[fg=$fg_color]"

# CPU / GPU Icons
set -g @cpu_low_icon "🤣"
set -g @cpu_medium_icon "🧐"
set -g @cpu_high_icon "🔥"

set -g @gpu_low_icon "🤣"
set -g @gpu_medium_icon "🧐"
set -g @gpu_high_icon "🔥"

# Battery Icons
set -g @batt_charged_icon "🔋 "
set -g @batt_charging_icon "⚡️ "
set -g @batt_attached_icon "⚠️  "
set -g @batt_full_charge_icon "🌕 "
set -g @batt_high_charge_icon "🌖 "
set -g @batt_medium_charge_icon "🌗 "
set -g @batt_low_charge_icon "🌘 "

# One Dark settings
set -g @onedark_date_first true
set -g @onedark_date_format "%A, %b %d"
set -g @onedark_time_format "%H:%m  #(curl http://wttr.in?format=1)"
set -g @onedark_widgets "${cpu_format}  ${gpu_format}  ${mem_format}  ${battery_format}"
