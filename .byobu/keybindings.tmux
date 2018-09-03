# F1: toggle fullscreen. Resize panes
# -----------------------------------

unbind -n F1
bind-key -n F1 resize-pane -Z

# Shift-F1: instead of showing the keybindings, "maximize" horizontally
# bind-key -n S-F1 resize-pane -L 1000 \; resize-pane -R 1000;

# balance evenly:
unbind -n S-F1
bind-key -n S-F1 send-keys 'perl ~/Settings/.byobu/balance_panes.pl R' ENTER

unbind -n C-F1
bind-key -n C-F1 send-keys 'perl ~/Settings/.byobu/balance_panes.pl U' ENTER

# toggle status bar
unbind -n C-S-F1
bind-key -n C-S-F1 set -g status

bind-key -n M-S-Up resize-pane -U 5
bind-key -n M-S-Down resize-pane -D 5
bind-key -n M-S-Left resize-pane -L 10
bind-key -n M-S-Right resize-pane -R 10

# uhm.. no better way to start external command?
# bind-key -n C-S-F1 send-keys 'tmux list-windows' ENTER

# F2: Make windows, panes.
# ------------------------

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
# downside: have to use shift-click-mouse-move to highlight text
set -g mouse on
# unbind-key -n C-s

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

