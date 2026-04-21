#!/usr/bin/env bash
# Clears the "waiting" state for any pane a tmux client is currently viewing.
# Triggered by tmux hooks on pane/window/session switches — the act of
# bringing a pane into view counts as "I saw the response."

set -u

dir="$HOME/.cache/claude-tmux-agent-status"
[ -d "$dir" ] || exit 0

viewed_ids=$(tmux list-panes -a -F '#{pane_id} #{pane_active} #{window_active} #{session_attached}' 2>/dev/null \
  | awk '$2==1 && $3==1 && $4>=1 {sub("^%","",$1); print $1}')

for id in $viewed_ids; do
  f="$dir/$id.state"
  if [ -f "$f" ] && [ "$(cat "$f" 2>/dev/null)" = "waiting" ]; then
    rm -f "$f"
  fi
done
