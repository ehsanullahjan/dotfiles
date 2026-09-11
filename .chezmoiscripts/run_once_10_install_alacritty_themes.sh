#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

themes_dir="$HOME/.config/alacritty/themes"
mkdir -p "$themes_dir"

for flavor in latte frappe macchiato mocha; do
	theme_file="$themes_dir/catppuccin-$flavor.toml"
	if [[ ! -f "$theme_file" ]]; then
		curl -fL -o "$theme_file" "https://github.com/catppuccin/alacritty/raw/main/catppuccin-$flavor.toml"
	fi
done
