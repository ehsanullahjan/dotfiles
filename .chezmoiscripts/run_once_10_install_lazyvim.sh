#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

lazyvim_dir="$HOME/.config/nvim"
if [[ ! -d "$lazyvim_dir" ]]; then
	git clone https://github.com/LazyVim/starter "$lazyvim_dir"
	rm -rf "$lazyvim_dir/.git"
fi
