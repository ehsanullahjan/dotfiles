#!/usr/bin/env bash

set -euo pipefail
[[ ${DEBUG:-0} == 1 ]] && set -x

oh_my_zsh_dir="${ZSH:-$HOME/.oh-my-zsh}"
if [[ ! -d "$oh_my_zsh_dir" ]]; then
	git clone https://github.com/ohmyzsh/ohmyzsh.git "$oh_my_zsh_dir"
fi

zsh_custom_dir="${ZSH_CUSTOM:-$oh_my_zsh_dir/custom}"
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
	plugin_dir="$zsh_custom_dir/plugins/$plugin"
	if [[ ! -d "$plugin_dir" ]]; then
		git clone "https://github.com/zsh-users/$plugin.git" "$plugin_dir"
	fi
done

mkdir -p "$HOME/.zshrc.d"
