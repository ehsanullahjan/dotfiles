#!/usr/bin/env bash

echo "::group:: ===$(basename "$0")==="

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

lazyvim_dir="$HOME/.config/nvim"
if [[ ! -d "$lazyvim_dir" ]]; then
	echo "Cloning LazyVim starter config"
	git clone https://github.com/LazyVim/starter "$lazyvim_dir"
	rm -rf "$lazyvim_dir/.git"
fi

echo "::endgroup::"
