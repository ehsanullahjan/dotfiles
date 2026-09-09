#!/usr/bin/env bash

set -euxo pipefail

plugin="$HOME/.config/tmux/plugins/catppuccin/catppuccin.tmux"

socket="$1"
theme_style="$2"
if [[ $theme_style =~ dark ]]; then
	flavor="macchiato"
else
	flavor="latte"
fi

tmux -S "$socket" source - <<-EOF
	# Force plugin to reset the theme
	set -g @catppuccin_flavor "$flavor"
	set -g @catppuccin_reset "true"
	run-shell $plugin

	# Apply our customizations
	set -g @catppuccin_flavor "$flavor"
	set -g @catppuccin_window_status_style "basic"
	set -g @catppuccin_window_flags "icon"
	set -g @catppuccin_window_text " #W"
	set -g @catppuccin_window_current_text " #W"
	set -g @catppuccin_status_left_separator "█"

	# Apply changes to fix stubborn modules
	# set -g @catppuccin_status_module_bg_color "#{@thm_surface_0}"
	set -g @catppuccin_status_application_text_fg "#{@thm_fg}"
	# set -g @catppuccin_status_battery_text_fg "#{@thm_fg}"
	# set -g @catppuccin_status_battery_text_bg "#{@thm_surface_0}"
	# set -g @catppuccin_battery_color "#{@thm_lavender}"
	run-shell $plugin
	refresh-client -S
EOF
