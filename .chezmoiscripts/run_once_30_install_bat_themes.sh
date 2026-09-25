#!/usr/bin/env bash

echo "::group:: ===$(basename "$0")==="

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

themes_dir="$HOME/.config/bat/themes"
mkdir -p "$themes_dir"

for flavor in latte frappe macchiato mocha; do
	theme_file="$themes_dir/catppuccin-$flavor.tmTheme"
	if [[ ! -f "$theme_file" ]]; then
		echo "Downloading bat theme: $(basename "$theme_file")"
		curl -fL -o "$theme_file" "https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20${flavor^}.tmTheme"
	fi
done

echo "Building bat cache"
bat cache --build

echo "::endgroup::"
