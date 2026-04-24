#!/bin/zsh
# Runs the /dependabot-prs Claude Code skill against a target repo.
# Scheduled by ~/Library/LaunchAgents/com.local.dependabot-prs.plist
# Target repo must be provided via DEPENDABOT_PRS_REPO (set in the plist's
# EnvironmentVariables, or exported before invoking manually).

set -uo pipefail

: "${DEPENDABOT_PRS_REPO:?DEPENDABOT_PRS_REPO must be set (target repo path)}"

LOG_DIR="$HOME/Library/Logs/claude-scheduled"
LOG_FILE="$LOG_DIR/dependabot-prs-$(date +%Y-%m-%d-%H%M%S).log"

mkdir -p "$LOG_DIR"

# launchd doesn't load a login shell, so set PATH explicitly
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

notify() {
  local title="$1"
  local message="$2"
  /usr/bin/osascript -e "display notification \"${message//\"/\\\"}\" with title \"$title\""
}

if ! cd "$DEPENDABOT_PRS_REPO"; then
  notify "Dependabot PRs: Failed" "Target repo not found: $DEPENDABOT_PRS_REPO"
  exit 1
fi

# auto permission mode uses the user's allowlist from ~/.claude/settings.json.
# -p runs non-interactively so the agent can complete unattended.
claude --permission-mode auto -p "/dependabot-prs" >> "$LOG_FILE" 2>&1
STATUS=$?

if [ $STATUS -eq 0 ]; then
  notify "Dependabot PRs: Success" "Completed. See $LOG_FILE"
else
  notify "Dependabot PRs: Failed" "Exit $STATUS. See $LOG_FILE"
fi

exit $STATUS
