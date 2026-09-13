#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

themes_dir="$HOME/.config/bat/themes"
mkdir -p "$themes_dir"

for flavor in latte frappe macchiato mocha; do
	theme_file="$themes_dir/catppuccin-$flavor.tmTheme"
	if [[ ! -f "$theme_file" ]]; then
		curl -fL -o "$theme_file" "https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20${flavor^}.tmTheme"
	fi
done

if command -v bat >/dev/null; then
	bat cache --build
fi
