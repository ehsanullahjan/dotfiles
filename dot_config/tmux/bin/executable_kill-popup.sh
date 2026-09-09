#!/usr/bin/env bash

set -euxo pipefail

while read -r session; do
	if [[ $session == *-popup ]]; then
		parent="${session%-popup}"
		if ! tmux has-session -t "=$parent" 2>/dev/null; then
			tmux kill-session -t "=$session"
		fi
	fi
done < <(tmux list-sessions -F '#{session_name}')
