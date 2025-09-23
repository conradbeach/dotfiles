#!/usr/bin/env bash

# Navigate to a worktree directory by partial match
wtcd() {
  if [ -z "$1" ]; then
    echo "Usage: wtcd <partial_worktree_name>"
    return 1
  fi

  local worktree_path=$(git worktree list | grep "$1" | head -n 1 | awk '{print $1}')

  if [ -z "$worktree_path" ]; then
    echo "No worktree found matching '$1'"
    return 1
  fi

  cd "$worktree_path"
}