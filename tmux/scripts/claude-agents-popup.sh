#!/usr/bin/env bash
# Interactive picker that lists Claude Code agents with state + cwd and
# jumps to the selected pane. Designed to run inside `tmux display-popup -E`.
# Driven by state files at ~/.cache/claude-tmux-agent-status/<pane-id>.state.

set -uo pipefail

dir="$HOME/.cache/claude-tmux-agent-status"

panes=$(tmux list-panes -a -F \
  '#{pane_id}|#{session_name}|#{window_index}|#{window_name}|#{pane_index}|#{pane_current_path}' \
  2>/dev/null)

rows=()
if [ -d "$dir" ]; then
  shopt -s nullglob
  for f in "$dir"/*.state; do
    id="%$(basename "$f" .state)"
    read -r state <"$f" || continue
    line=$(awk -F'|' -v id="$id" '$1==id {print; exit}' <<<"$panes")
    [ -z "$line" ] && continue
    IFS='|' read -r _ session window wname pindex cwd <<<"$line"
    target="$session:$window.$pindex"
    sort_key=$([ "$state" = waiting ] && echo 0 || echo 1)
    rows+=("$sort_key|$state|$target|$wname|$cwd")
  done
fi

if [ "${#rows[@]}" -eq 0 ]; then
  printf '\nNo tracked Claude agents.\n\n(press any key to close)\n'
  read -r -n1 -s
  exit 0
fi

selection=$(printf '%s\n' "${rows[@]}" | sort | awk -F'|' '
  BEGIN { red="\033[1;41;97m"; grey="\033[30;47m"; reset="\033[0m" }
  {
    state = $2; target = $3; wname = $4; cwd = $5
    label = (state == "waiting" ? red " WAITING " reset : grey " working " reset)
    printf "%s  %-30s %s\t%s\n", label, target " (" wname ")", cwd, target
  }
' | fzf --ansi --with-nth=1 --delimiter=$'\t' --prompt="agents > " --height=100% --border=rounded)

target=$(awk -F'\t' '{print $2}' <<<"$selection")
if [ -n "$target" ]; then
  session="${target%%:*}"
  tmux switch-client -t "$session"
  tmux select-window -t "$target"
  tmux select-pane -t "$target"
fi
