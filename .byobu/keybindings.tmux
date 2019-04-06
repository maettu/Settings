# reload config
unbind -n M-R
bind-key -n M-R source $BYOBU_PREFIX/share/byobu/profiles/tmuxrc

# F1: toggle fullscreen. Resize panes
# -----------------------------------

unbind -n F1
bind-key -n F1 resize-pane -Z
unbind -n M-f
bind-key -n M-f resize-pane -Z

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
unbind -n M-s
bind-key -n M-s set -g status

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
unbind-key -n M-w
bind-key -n M-w new-window -c "#{pane_current_path}" \; rename-window "-"

bind-key -n M-r command-prompt -p "(rename-window) " "rename-window '%%'"

# Shift-F2: split horizontally
unbind-key -n  S-F2
bind-key -n S-F2 display-panes \; split-window -hc "#{pane_current_path}"
unbind-key -n  M-p
bind-key -n M-p display-panes \; split-window -hc "#{pane_current_path}"

# Ctrl-F2: split vertically
unbind-key -n  C-F2
bind-key -n C-F2 display-panes \; split-window -vc "#{pane_current_path}"
unbind-key -n  M-P
bind-key -n M-P display-panes \; split-window -vc "#{pane_current_path}"

# The following two are not extremely useful, as they even out *all* panes.
# Desired was a cleverer way of evening out.
unbind-key -n F10
bind-key -n F10 select-layout even-horizontal
unbind-key -n M-b
bind-key -n M-b select-layout even-horizontal

unbind-key -n F11
bind-key -n F11 select-layout even-vertical

# move between windows
# --------------------
bind-key -n M-Tab next-window
# does not work
# bind-key -n M-S-Tab previous-window
bind-key -n M-l next-window
bind-key -n M-h previous-window
# Start windows and panes at 1, not 0
# -t is "target"
set -g base-index 1
bind-key -n M-1 select-window -t 1
bind-key -n M-2 select-window -t 2
bind-key -n M-3 select-window -t 3
bind-key -n M-4 select-window -t 4
bind-key -n M-5 select-window -t 5
bind-key -n M-6 select-window -t 6
bind-key -n M-7 select-window -t 7
bind-key -n M-8 select-window -t 8
bind-key -n M-9 select-window -t 9
bind-key -n M-0 select-window -t 0



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

