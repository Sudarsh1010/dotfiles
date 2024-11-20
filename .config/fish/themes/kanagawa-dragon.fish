# Kanagawa Dragon Fish Shell Theme

# Color palette
set -l dragon_background 1f1f28
set -l dragon_foreground dcd7ba
set -l dragon_cursor c8c093
set -l dragon_selection 2d4f67
set -l dragon_comment 727169

set -l dragon_black 090618
set -l dragon_red c34043
set -l dragon_green 76946a
set -l dragon_yellow c0a36e
set -l dragon_blue 7e9cd8
set -l dragon_magenta 957fb8
set -l dragon_cyan 6a9589
set -l dragon_white c8c093

# Syntax highlighting
set -g fish_color_normal $dragon_foreground
set -g fish_color_command $dragon_blue
set -g fish_color_keyword $dragon_magenta
set -g fish_color_quote $dragon_green
set -g fish_color_redirection $dragon_yellow
set -g fish_color_end $dragon_cyan
set -g fish_color_error $dragon_red
set -g fish_color_param $dragon_foreground
set -g fish_color_comment $dragon_comment
set -g fish_color_selection --background=$dragon_selection
set -g fish_color_search_match --background=$dragon_selection

# Prompt colors
set -g fish_color_autosuggestion $dragon_comment
set -g fish_color_user $dragon_green
set -g fish_color_host $dragon_blue
set -g fish_color_host_remote $dragon_magenta

# Completion pager colors
set -g fish_pager_color_progress $dragon_comment
set -g fish_pager_color_background
set -g fish_pager_color_prefix $dragon_cyan
set -g fish_pager_color_completion $dragon_foreground
set -g fish_pager_color_description $dragon_comment
set -g fish_pager_color_selected_background --background=$dragon_selection
set -g fish_pager_color_selected_prefix $dragon_cursor
set -g fish_pager_color_selected_completion $dragon_cursor
