#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

themes_dir="$HOME/.config/alacritty/themes"
mkdir -p "${themes_dir}"

theme_base_url="https://github.com/catppuccin/alacritty/raw/main"
for flavor in latte frappe macchiato mocha; do
	curl -fsSL -O --output-dir "${themes_dir}" "${theme_base_url}/catppuccin-${flavor}.toml"
done
