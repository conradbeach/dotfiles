####################
# Config
####################
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="/Users/$USER/.cargo/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export SHELL="/bin/zsh"

# With this set, zsh sessions will append their history list to the history file, rather than replace it.
# Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file, in the order that they exit.
setopt appendhistory

# Vi Mode (http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Keymaps-1)
bindkey -v # Change keybindings to vi.
bindkey '^?' backward-delete-char # By default, you can't backspace all text after changing from normal mode to insert mode. This changes it so you can.
export KEYTIMEOUT=1 # Sets the delay when switching between normal and insert mode. Default is 4 which is 0.4 seconds.

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Increase file descriptor ulimit. This prevents an AstroNvim issue I was running into.
# https://github.com/AstroNvim/AstroNvim/issues/1896
ulimit -n 1024

# Claude
alias cc="claude"
alias ccc="claude --continue"
alias ccr="claude --resume"

# direnv
eval "$(direnv hook zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(lvim {})+abort'"
alias preview="fzf --preview 'bat --color \"always\" {}'"

# Homewbrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ripgrep
export RIPGREP_CONFIG_PATH=~/.ripgreprc

## Starship (https://starship.rs)
eval "$(starship init zsh)"

# Zsh Syntax Highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
# Needs to be sourced last.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


####################
# Aliases
#####################

## General
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias sed="sed -E"
alias help="tldr"
alias n="nvim"
alias cl="clear"
alias src="source ~/.zshrc"
alias bs="brew services"
alias mux="tmuxinator"
alias ms="mux start"
alias home="cd && clear"
## Overrides (Remember that you can run the original command by prepending it with a \. e.g. `\cat` will run the real cat instead of bat.)
alias ls="eza --all --group-directories-first --icons"
alias cat="bat --theme=OneHalfLight"
alias top="htop"
alias find="fd -H"
## Ruby & Rails
alias be="bundle exec"
alias berc="bundle exec rubocop"
alias bepr="bundle exec parallel_rspec"
alias rdm="bundle exec rails db:migrate"
alias rdr="bundle exec rails db:rollback"
alias rdmr="bundle exec rails db:migrate:redo"
alias tof="bundle exec rspec --format=documentation --only-failures"
alias toof="bundle exec rspec --format=documentation --next-failure"
## Git
alias gco="git checkout"
alias gri="git rebase -i --autosquash"
alias grc="git rebase --continue"
alias grmaster="git rebase master -i --autosquash"
alias grmain="git rebase main -i --autosquash"
alias gcf="git commit --fixup"
alias gce="git commit --allow-empty"
alias gcnv="git commit --no-verify"
alias gpsh="git push"
alias gpl="git pull"
alias gpf="git push --force-with-lease"
alias gs="git stash"
alias gsp="git stash pop"
alias wt="git worktree"
alias wtl="git worktree list"

####################
# Functions
####################

# Reports the result of a command with a checkmark or X
# $1 - The name of the check
# $2 - The status code to check
report_result() {
  echo "$1: $([ $2 = 0 ] && echo "✅ Passed" || echo "❌ Failed")"
}

# Check Current Project - Automatically detect project and run appropriate checks.
chp() {
  local current_dir=$(pwd)
  
  if [[ "$current_dir" == *"irms-api"* ]]; then
    echo "Detected irms-api, running chia..."
    chia
  elif [[ "$current_dir" == *"media-api"* ]]; then
    echo "Detected Media API, running chma..."
    chma
  elif [[ "$current_dir" == *"grand_central_station"* ]]; then
    echo "Detected Grand Central Station, running chgcs..."
    chgcs
  else
    echo "❌ Could not detect project for directory: $current_dir"
    echo "Available check functions: chia (irms-api), chgcs (Grand Central Station), chma (Media API)"
    return 1
  fi
}

# Check irms-api
chia() {
  echo "\n---------- Running RSpec ----------"
  bundle exec rspec
  rspec_status=$?

  echo "\n---------- Running Rubocop ----------"
  bundle exec rubocop --display-style-guide
  rubocop_status=$?

  echo "\n---------- Running Bundler Audit ----------"
  bundle exec bundler-audit check --update
  audit_status=$?

  echo "\n---------- Running Brakeman ----------"
  bundle exec brakeman --no-pager
  brakeman_status=$?

  echo "\n---------- Results ----------"
  report_result "RSpec" $rspec_status
  report_result "Rubocop" $rubocop_status
  report_result "Bundler Audit" $audit_status
  report_result "Brakeman" $brakeman_status

  # Return overall success
  return $(( rspec_status + rubocop_status + audit_status + brakeman_status ))
}

# Check Grand Central Station
chgcs() {
  echo "\n---------- Running RSpec ----------"
  bundle exec rspec
  rspec_status=$?

  echo "\n---------- Running minitest ----------"
  rails test
  minitest_status=$?

  echo "\n---------- Running Standard ----------"
  bundle exec standardrb
  standard_status=$?

  echo "\n---------- Running Bundler Audit ----------"
  bundler-audit check --update
  audit_status=$?

  echo "\n---------- Running Brakeman ----------"
  brakeman --no-pager
  brakeman_status=$?


  echo "\n---------- Results ----------"
  report_result "RSpec" $rspec_status
  report_result "Minitest" $minitest_status
  report_result "Standard" $standard_status
  report_result "Bundler Audit" $audit_status
  report_result "Brakeman" $brakeman_status

  # Return overall success
  return $(( rspec_status + minitest_status + standard_status + audit_status + brakeman_status ))
}

# Check Media API
chma() {
  echo "\n---------- Running Rubocop ----------"
  bundle exec rubocop
  rubocop_status=$?

  echo "\n---------- Running Parallel RSpec ----------"
  bundle exec parallel_rspec
  rspec_status=$?

  echo "\n---------- Results ----------"
  report_result "Rubocop" $rubocop_status
  report_result "RSpec" $rspec_status

  # Return overall success
  return $(( rubocop_status + cucumber_status + rspec_status ))
}

# Update Media API Database
restore_media_api_dbs() {
  set -o xtrace
  
  # Always update bookshelf_development
  dropdb bookshelf_development
  createdb bookshelf_development
  time pg_restore -d bookshelf_development -j 6 $1
  # Using taskpolicy, it took 24 minutes to restore both databases.
  # Test without taskpolicy.
  
  # Optionally update usage database if second argument provided
  if [ -n "$2" ]; then
    dropdb usage_development
    createdb usage_development
    time pg_restore -d usage_development -j 6 $2
  fi
}

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

  if [ -d "$main_repo_dir/.claude" ]; then cp -r "$main_repo_dir/.claude" "$worktree_dir/"; fi
  if [ -f "$main_repo_dir/CLAUDE.local.md" ]; then cp "$main_repo_dir/CLAUDE.local.md" "$worktree_dir/"; fi
  if [ -f "$main_repo_dir/config/application.yml" ]; then cp "$main_repo_dir/config/application.yml" "$worktree_dir/config/"; fi
  if [ -f "$main_repo_dir/.envrc" ]; then
    cp "$main_repo_dir/.envrc" "$worktree_dir/"
    (cd "$worktree_dir" && direnv allow)
  fi

  echo -n "\nNavigate to the new worktree directory? (y/n): "
  read -r response
  if [[ "$response" =~ ^[Yy]$ ]]; then cd $worktree_dir; fi
}

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
