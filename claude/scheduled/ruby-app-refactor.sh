#!/bin/zsh
# Runs the /ruby-app-refactor Claude Code skill against a target repo.
# Scheduled by ~/Library/LaunchAgents/com.local.ruby-app-refactor.plist
# Target repo must be provided via RUBY_APP_REFACTOR_REPO (set in the plist's
# EnvironmentVariables, or exported before invoking manually).

set -uo pipefail

: "${RUBY_APP_REFACTOR_REPO:?RUBY_APP_REFACTOR_REPO must be set (target repo path)}"

LOG_DIR="$HOME/Library/Logs/claude-scheduled"
LOG_FILE="$LOG_DIR/ruby-app-refactor-$(date +%Y-%m-%d-%H%M%S).log"

mkdir -p "$LOG_DIR"

# launchd doesn't load a login shell, so set PATH explicitly
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

notify() {
  local title="$1"
  local message="$2"
  /usr/bin/osascript -e "display notification \"${message//\"/\\\"}\" with title \"$title\""
}

if ! cd "$RUBY_APP_REFACTOR_REPO"; then
  notify "Ruby App Refactor: Failed" "Target repo not found: $RUBY_APP_REFACTOR_REPO"
  exit 1
fi

# auto permission mode uses the user's allowlist from ~/.claude/settings.json.
# -p runs non-interactively so the agent can complete unattended.
claude --permission-mode auto -p "/ruby-app-refactor" >> "$LOG_FILE" 2>&1
STATUS=$?

PR_URL=$(grep -oE "https://github.com/[^ ]+/pull/[0-9]+" "$LOG_FILE" | head -n 1)

if [ $STATUS -eq 0 ]; then
  if [ -n "$PR_URL" ]; then
    notify "Ruby App Refactor: Success" "Draft PR opened: $PR_URL"
  else
    notify "Ruby App Refactor: Success" "Completed without a PR (may have skipped this run). See $LOG_FILE"
  fi
else
  notify "Ruby App Refactor: Failed" "Exit $STATUS. See $LOG_FILE"
fi

exit $STATUS
