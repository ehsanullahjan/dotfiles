#!/usr/bin/env bash

echo "::group:: ===$(basename "$0")==="

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

themes_dir="$HOME/.config/starship/themes"
mkdir -p "$themes_dir"

themes=(
	catppuccin-powerline
	gruvbox-rainbow
	nerd-font-symbols
	no-nerd-font
	pure-preset
	tokyo-night
)
touch "$themes_dir/default.toml"
for theme in "${themes[@]}"; do
	theme_file="$themes_dir/$theme.toml"
	if [[ ! -f "$theme_file" ]]; then
		echo "Downloading starship theme: $(basename "$theme_file")"
		starship preset "$theme" -o "$theme_file"
	fi
done

echo "::endgroup::"
