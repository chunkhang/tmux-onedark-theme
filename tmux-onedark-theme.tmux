#!/bin/bash

onedark_black="#282c34"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#98c379"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

# -fg and -bg options are deprecated in tmux 2.9
# https://github.com/tmux/tmux/wiki/FAQ#how-do-i-translate--fg--bg-and--attr-options-into--style-options

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-style" "fg=$onedark_white" "bg=$onedark_black"
set "message-command-style" "fg=$onedark_white" "bg=$onedark_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-style" "fg=$onedark_black" "bg=$onedark_black"
setw "window-status-attr" "none"

setw "window-status-activity-style" "fg=$onedark_black" "bg=$onedark_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$onedark_white"
set "window-active-style" "fg=$onedark_white"

set "pane-border-style" "fg=$onedark_comment_grey" "bg=$onedark_black"
set "pane-active-border-style" "fg=$onedark_white" "bg=$onedark_black"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-style" "fg=$onedark_white" "bg=$onedark_black"

set "@prefix_highlight_fg" "$onedark_black"
set "@prefix_highlight_bg" "$onedark_blue"

set "status-left" "#[fg=$onedark_black,bg=$onedark_blue] #S "

pane_sync=#{?pane_synchronized,*,}

set "window-status-format" " #[fg=$onedark_white,bg=$onedark_black] #I${pane_sync} #W "
set "window-status-current-format" " #[fg=$onedark_white,bg=$onedark_visual_grey] #I${pane_sync} #W #[fg=$onedark_black]"
