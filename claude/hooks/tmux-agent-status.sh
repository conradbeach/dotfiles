#!/usr/bin/env bash
# Records Claude Code agent state per tmux pane so the tmux status bar
# can surface which panes have an agent working or waiting for input.
#
# Invoked from Claude Code hooks (UserPromptSubmit / PreToolUse / Stop /
# Notification). State files live at
# ~/.cache/claude-tmux-agent-status/<pane-id>.state. If Claude isn't
# running inside tmux, this script is a no-op.

set -euo pipefail

event="${1:-}"
[ -z "$event" ] && exit 0
[ -z "${TMUX_PANE:-}" ] && exit 0

dir="$HOME/.cache/claude-tmux-agent-status"
mkdir -p "$dir"

state_file="$dir/${TMUX_PANE#%}.state"

case "$event" in
  UserPromptSubmit|PreToolUse)
    echo working >"$state_file"
    ;;
  Stop)
    # Only flag "waiting" if the user isn't already looking at this pane.
    # A pane is "viewed" when it's the active pane of an active window in a
    # session that has at least one attached client.
    viewed=$(tmux list-panes -a -F '#{pane_id} #{pane_active} #{window_active} #{session_attached}' 2>/dev/null \
      | awk -v p="$TMUX_PANE" '$1==p && $2==1 && $3==1 && $4>=1 {print 1; exit}')
    if [ -n "$viewed" ]; then
      rm -f "$state_file"
    else
      echo waiting >"$state_file"
    fi
    ;;
  SessionEnd)
    rm -f "$state_file"
    ;;
esac

exit 0
