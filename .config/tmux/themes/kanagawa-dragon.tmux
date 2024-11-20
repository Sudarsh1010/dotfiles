# Kanagawa Dragon Tmux Theme

# Color palette
dragon_background="#1f1f28"
dragon_foreground="#dcd7ba"
dragon_cursor="#c8c093"
dragon_selection="#2d4f67"
dragon_comment="#727169"

dragon_black="#090618"
dragon_red="#c34043"
dragon_green="#76946a"
dragon_yellow="#c0a36e"
dragon_blue="#7e9cd8"
dragon_magenta="#957fb8"
dragon_cyan="#6a9589"
dragon_white="#c8c093"

# Basic status bar colors
set-option -g status-bg "$dragon_background"
set-option -g status-fg "$dragon_foreground"

# Window status
set-window-option -g window-status-style "bg=$dragon_background,fg=$dragon_white"
set-window-option -g window-status-current-style "bg=$dragon_selection,fg=$dragon_cursor,bold"

# Pane border
set-option -g pane-border-style "fg=$dragon_comment"
set-option -g pane-active-border-style "fg=$dragon_blue"

# Message text
set-option -g message-style "bg=$dragon_selection,fg=$dragon_cursor"

# Modes
set-window-option -g mode-style "bg=$dragon_selection,fg=$dragon_cursor"

# Clock
set-window-option -g clock-mode-colour "$dragon_blue"

# Status bar elements
set-option -g status-left "#[fg=$dragon_black,bg=$dragon_blue] #S #[fg=$dragon_blue,bg=$dragon_background,nobold,noitalics,nounderscore]"
set-option -g status-right "#[fg=$dragon_comment,bg=$dragon_background]  %Y-%m-%d  %H:%M #[fg=$dragon_blue,bg=$dragon_comment]  #h "

# Window status format
set-window-option -g window-status-format "#[fg=$dragon_white,bg=$dragon_background] #I #W "
set-window-option -g window-status-current-format "#[fg=$dragon_cursor,bg=$dragon_selection] #I #W "
