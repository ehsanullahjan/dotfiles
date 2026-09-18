#!/usr/bin/env bash

echo "::group:: ===$(basename "$0")==="

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

plugins_dir="$HOME/.config/tmux/plugins"
mkdir -p "$plugins_dir"

# https://github.com/tmux-plugins/tpm
tpm_plugin_dir="$plugins_dir/tpm"
if [[ ! -d "$tpm_plugin_dir" ]]; then
	echo "Cloning tmux plugin manager: tpm"
	git clone https://github.com/tmux-plugins/tpm "$tpm_plugin_dir"
fi

# https://github.com/catppuccin/tmux
catppuccin_plugin_dir="$plugins_dir/catppuccin"
if [[ ! -d "$catppuccin_plugin_dir" ]]; then
	echo "Cloning tmux theme plugin: catppuccin"
	git clone -b v2.3.0 https://github.com/catppuccin/tmux.git "$catppuccin_plugin_dir"
fi

echo "::endgroup::"
