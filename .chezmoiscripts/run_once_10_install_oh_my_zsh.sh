#!/usr/bin/env bash

echo "::group:: ===$(basename "$0")==="

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

oh_my_zsh_dir="${ZSH:-$HOME/.oh-my-zsh}"
if [[ ! -d "$oh_my_zsh_dir" ]]; then
	echo "Cloning oh-my-zsh"
	git clone https://github.com/ohmyzsh/ohmyzsh.git "$oh_my_zsh_dir"
fi

install_plugin() {
	local repo="$1"
	local plugin="${repo#*/}"
	local plugin_dir="$zsh_custom_dir/plugins/$plugin"
	if [[ ! -d "$plugin_dir" ]]; then
		echo "Cloning oh-my-zsh plugin: $repo"
		git clone "https://github.com/$repo.git" "$plugin_dir"
	fi
}

zsh_custom_dir="${ZSH_CUSTOM:-$oh_my_zsh_dir/custom}"
install_plugin "Aloxaf/fzf-tab"
install_plugin "ehsanullahjan/zsh-sesh"
install_plugin "zsh-users/zsh-autosuggestions"
install_plugin "zsh-users/zsh-syntax-highlighting"

mkdir -p "$HOME/.zshrc.d"

echo "::endgroup::"
