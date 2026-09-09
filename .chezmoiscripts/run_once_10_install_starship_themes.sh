#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

starship_dir="$HOME/.config/starship"
themes_dir="$starship_dir/themes"
mkdir -p "$themes_dir"

for theme in catppuccin-powerline gruvbox-rainbow nerd-font-symbols pure-preset tokyo-night; do
	theme_file="$themes_dir/$theme.toml"
	if [[ ! -f "$theme_file" ]]; then
		starship preset $theme -o "$theme_file"
	fi
done

default_theme="$starship_dir/theme.toml"
if [[ ! -f "$default_theme" ]]; then
	cp "$themes_dir/nerd-font-symbols.toml" "$default_theme"
fi
