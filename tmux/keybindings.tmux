# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind h   if-shell "$is_vim" "send C-a C-h" "select-pane -L"
bind C-h if-shell "$is_vim" "send C-a C-h" "select-pane -L"
bind j   if-shell "$is_vim" "send C-a C-j" "select-pane -D"
bind C-j if-shell "$is_vim" "send C-a C-j" "select-pane -D"
bind l   if-shell "$is_vim" "send C-a C-l" "select-pane -R"
bind C-l if-shell "$is_vim" "send C-a C-l" "select-pane -R"
bind k   if-shell "$is_vim" "send C-a C-k" "select-pane -U"
bind C-k if-shell "$is_vim" "send C-a C-k" "select-pane -U"
bind 'C-\' if-shell "$is_vim" "send 'C-a \\'" "select-pane -l"

# Binds below are based on tmux-pain-control
# Window move bindings
bind -r "<" swap-window -t -1
bind -r ">" swap-window -t +1

# Pane resizing bindings
bind -r H resize-pane -L 1
bind -r J resize-pane -D 1
bind -r K resize-pane -U 1
bind -r L resize-pane -R 1

# Pane split bindings
bind "|"  split-window -h  -c "#{pane_current_path}"
bind "\\" split-window -fh -c "#{pane_current_path}"
bind "-"  split-window -v  -c "#{pane_current_path}"
bind "_"  split-window -fv -c "#{pane_current_path}"
bind "%"  split-window -h  -c "#{pane_current_path}"
bind '"'  split-window -v  -c "#{pane_current_path}"

# Improve new window binding
bind "c" new-window -c "#{pane_current_path}"
