#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

themes_dir="$HOME/.config/btop/themes"
mkdir -p "$themes_dir"

for flavor in latte frappe macchiato mocha; do
	theme_file="$themes_dir/catppuccin-$flavor.theme"
	if [[ ! -f "$theme_file" ]]; then
		curl -fL -o "$theme_file" "https://github.com/catppuccin/btop/raw/main/catppuccin_$flavor.theme"
	fi
done
