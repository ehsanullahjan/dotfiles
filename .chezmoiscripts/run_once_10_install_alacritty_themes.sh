#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

themes_dir="$HOME/.config/alacritty/themes"
mkdir -p "$themes_dir"

flavors=(
	latte
	frappe
	macchiato
	mocha
)
for flavor in "${flavors[@]}"; do
	filename="catppuccin-$flavor.toml"
	if [[ ! -f "$themes_dir/$filename" ]]; then
		curl -fsSL -O --output-dir "$themes_dir" "https://github.com/catppuccin/alacritty/raw/main/$filename"
	fi
done
