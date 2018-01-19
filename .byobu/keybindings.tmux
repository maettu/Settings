# F1: toggle fullscreen. Need this for copy-paste
unbind -n F1
bind-key -n F1 resize-pane -Z

# Shift-F1: instead of showing the keybindings, show status bar
unbind -n S-F1
bind-key -n S-F1 set -g status on

unbind -n C-F1
bind-key -n C-F1 set -g status off

# F2: Make windows, panes.

unbind-key -n F2
bind-key -n F2 new-window -c "#{pane_current_path}" \; rename-window "-"

# Shift-F2: split horizontally
unbind-key -n  S-F2
bind-key -n S-F2 display-panes \; split-window -hc "#{pane_current_path}"

# Ctrl-F2: split vertically
unbind-key -n  C-F2
bind-key -n C-F2 display-panes \; split-window -vc "#{pane_current_path}"

# The following two are not extremely useful, as they even out *all* panes.
# Desired was a cleverer way of evening out.
unbind-key -n F10
bind-key -n F10 select-layout even-horizontal

unbind-key -n F11
bind-key -n F11 select-layout even-vertical

# enable mouse click to switch between tabs / desktops
set -g mouse on
unbind-key -n C-s

# ctrl-tab to switch between panes
unbind-key -n Tab
bind-key Tab display-panes \; select-pane -t:.+

# border colors
set -g pane-active-border-style fg='colour74'
set -g pane-border-style fg='colour235'

unbind-key -n C-a
unbind-key -n C-b
set -g prefix ^B
set -g prefix2 ^B
bind b send-prefix

