#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

tmux_plugins_dir="$HOME/.config/tmux/plugins"
mkdir -p "$tmux_plugins_dir"

# https://github.com/tmux-plugins/tpm
tpm_dir="$tmux_plugins_dir/tpm"
if [[ ! -d "$tpm_dir" ]]; then
	git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
fi

# https://github.com/catppuccin/tmux
catppuccin_dir="$tmux_plugins_dir/catppuccin"
if [[ ! -d "$catppuccin_dir" ]]; then
	git clone -b v2.3.0 https://github.com/catppuccin/tmux.git "$catppuccin_dir"
fi
