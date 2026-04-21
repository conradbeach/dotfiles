#!/usr/bin/env bash
# Emits a tmux status-right segment summarizing Claude Code agent state
# across all panes. Driven by state files written by
# ~/.claude/hooks/tmux-agent-status.sh. Runs every status-interval tick,
# so keep it fast.

set -u

dir="$HOME/.cache/claude-tmux-agent-status"
[ -d "$dir" ] || exit 0

live_ids=$(tmux list-panes -a -F '#{pane_id}' 2>/dev/null | tr -d '%' || true)

working=0
waiting=0

shopt -s nullglob
for f in "$dir"/*.state; do
  id=$(basename "$f" .state)
  if ! grep -qx "$id" <<<"$live_ids"; then
    rm -f "$f"
    continue
  fi
  read -r state <"$f" || continue
  case "$state" in
    working) working=$((working + 1)) ;;
    waiting) waiting=$((waiting + 1)) ;;
  esac
done

output=""

if [ "$waiting" -gt 0 ]; then
  output+="#[fg=colour231,bg=colour160,bold] $waiting waiting #[default]"
fi

if [ "$working" -gt 0 ]; then
  output+="#[fg=colour0,bg=colour250] $working working #[default]"
fi

printf '%s' "$output"
