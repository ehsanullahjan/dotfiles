#!/usr/bin/env bash

set -euxo pipefail

session="$1"
cwd="$2"
popup="${session}-popup"

if [[ "$session" == *"-popup" ]]; then
	tmux detach-client
else
	# Create and configure a new tmux session
	if ! tmux has-session -t "${popup}" 2>/dev/null; then
		tmux new -d -s "${popup}" -c "${cwd}"
		tmux set -t "${popup}" status-left ''
		tmux set -t "${popup}" status-right ''
	fi

	# Attach to the popup session
	tmux display-popup \
		-w 80% \
		-h 90% \
		-b rounded \
		-S "fg=cyan" \
		-T " ${popup} " \
		-E "tmux attach -t '${popup}'"
fi
