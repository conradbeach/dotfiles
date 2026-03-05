# Attach or create tmux session named the same as current directory.
tat() {
  path_name="$(basename "$PWD" | tr . -)"

  git_common_dir="$(git rev-parse --git-common-dir 2>/dev/null)"
  if [[ "$git_common_dir" = /* ]]; then
    # In a worktree; git-common-dir is an absolute path to the main repo's .git
    repo_root="$(dirname "$git_common_dir")"
  else
    repo_root="$(git rev-parse --show-toplevel 2>/dev/null)"
  fi
  if [ -n "$repo_root" ]; then
    repo_name="$(basename "$repo_root" | tr . -)"
    if [ "$repo_name" = "$path_name" ]; then
      default_name="$repo_name"
    else
      default_name="${repo_name}/${path_name}"
    fi
  else
    default_name="$path_name"
  fi

  session_name="${1-$default_name}"

  not_in_tmux() {
    [ -z "$TMUX" ]
  }

  session_exists() {
    tmux has-session -t "=$session_name"
  }

  create_detached_session() {
    (TMUX='' tmux new-session -Ad -s "$session_name")
  }

  create_if_needed_and_attach() {
    if not_in_tmux; then
      tmux new-session -As "$session_name"
    else
      if ! session_exists; then
        create_detached_session
      fi
      tmux switch-client -t "$session_name"
    fi
  }

  create_if_needed_and_attach
}
