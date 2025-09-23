# Create a new worktree and copy Git ignored files to the worktree directory.
wtc() {
  local git_common_dir=$(git rev-parse --git-common-dir)
  local main_repo_dir
  
  if [[ "$git_common_dir" = ".git" ]]; then
    # We're in the main repository
    main_repo_dir=$(git rev-parse --show-toplevel)
  else
    # We're in a worktree, git_common_dir points to main repo's .git
    main_repo_dir=$(dirname "$git_common_dir")
  fi
  
  local repo_name=$(basename "$main_repo_dir")
  local worktree_dir="${main_repo_dir}/../${repo_name}.worktrees/$1"
  local current_branch=$(git branch --show-current)

  echo -n "Create worktree based on branch '$current_branch'? (y/n): "
  read -r response

  if [[ ! "$response" =~ ^[Yy]$ ]]; then
    echo "Available branches:"
    git branch | nl -w3 -s'. '
    echo -n "Enter the number of the branch to base the worktree on (or 'q' to quit): "
    read -r branch_num
    
    if [[ "$branch_num" == "q" ]]; then
      echo "Worktree creation aborted."
      return 1
    fi
    
    selected_branch=$(git branch | sed -n "${branch_num}p" | sed 's/^[*+ ]*//')
    
    if [[ -z "$selected_branch" ]]; then
      echo "Invalid selection. Worktree creation aborted."
      return 1
    fi
    
    echo "Creating worktree based on branch '$selected_branch'"
    git worktree add $worktree_dir -b $1 $selected_branch
  else
    git worktree add $worktree_dir -b $1
  fi

  if [ -f "$main_repo_dir/CLAUDE.local.md" ]; then cp "$main_repo_dir/CLAUDE.local.md" "$worktree_dir/"; fi
  if [ -d "$main_repo_dir/.claude" ]; then cp -r "$main_repo_dir/.claude" "$worktree_dir/"; fi
  if [ -f "$main_repo_dir/config/application.yml" ]; then cp "$main_repo_dir/config/application.yml" "$worktree_dir/config/"; fi
  if [ -f "$main_repo_dir/.envrc" ]; then
    cp "$main_repo_dir/.envrc" "$worktree_dir/"
    (cd "$worktree_dir" && direnv allow)
  fi

  echo -n "\nNavigate to the new worktree directory? (y/n): "
  read -r response
  if [[ "$response" =~ ^[Yy]$ ]]; then cd $worktree_dir; fi
}
