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

if command -v nvim >/dev/null; then
	echo "Applying LazyVim plugin updates"
	nvim --headless "+Lazy! sync" +qa

	echo "Applying LazyVim mason updates "
	nvim --headless "+Lazy! update mason.nvim" +qa
fi

echo "::endgroup::"
