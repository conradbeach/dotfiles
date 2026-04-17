#!/usr/bin/env bash
# Stop hook: block Claude from ending a turn when roborev has
# findings on the current branch that haven't been addressed, or when
# reviews are still in-flight (e.g. a review kicked off by the
# post-commit hook is still running).
#
# Silent (exit 0) when:
#   - roborev is not installed
#   - we're not inside a git repo / the repo isn't roborev-initialized
#   - the hook is already active for this stop cycle (avoids loops)
#   - this Claude session IS a roborev review agent (would otherwise
#     derail the review output)
#   - there are no in-flight reviews and no unaddressed failing reviews
#
# Blocks (exit 2, message on stderr) otherwise.
#
# Fail-open: if roborev or jq misbehave (missing binary, malformed
# output, network hiccup), the hook exits 0 rather than blocking. A
# broken hook that trapped every Stop would be worse than a quiet one.

set -u

command -v roborev >/dev/null 2>&1 || exit 0
command -v jq >/dev/null 2>&1 || exit 0

input=$(cat)

# Avoid looping forever when Claude genuinely can't resolve the findings.
stop_hook_active=$(printf '%s' "$input" | jq -r '.stop_hook_active // false' 2>/dev/null)
if [ "$stop_hook_active" = "true" ]; then
  exit 0
fi

# `roborev list` defaults to the current branch and current repo.
# Any non-zero exit (uninitialized repo, network failure, daemon
# crash, auth issue, etc.) falls through to a silent bail, per the
# fail-open philosophy documented in the header.
reviews=$(roborev list --limit 50 --json 2>/dev/null) || exit 0
if [ -z "$reviews" ] || [ "$reviews" = "null" ]; then
  exit 0
fi

# Skip when this session IS a roborev review agent. Roborev stores the
# Claude session_id of each job it spawns; if our session_id matches any
# recent job's session_id, we're running inside that review and must not
# block, or we'll corrupt the review output.
session_id=$(printf '%s' "$input" | jq -r '.session_id // ""' 2>/dev/null)
if [ -n "$session_id" ]; then
  if printf '%s' "$reviews" \
    | jq -e --arg sid "$session_id" \
      'any(.[]; .session_id == $sid)' >/dev/null 2>&1; then
    exit 0
  fi
fi

unaddressed=$(printf '%s' "$reviews" \
  | jq -r '[.[] | select(.verdict == "F" and .closed == false) | .id] | join(",")')
in_flight=$(printf '%s' "$reviews" \
  | jq -r '[.[] | select(.status == "queued" or .status == "running") | .id] | join(",")')

if [ -z "$unaddressed" ] && [ -z "$in_flight" ]; then
  exit 0
fi

{
  echo "RoboRev has review state on this branch that you haven't dealt with."
  echo
  if [ -n "$in_flight" ]; then
    echo "- In-flight reviews (IDs: $in_flight) — run \`roborev wait\` to block until they finish, then re-check."
  fi
  if [ -n "$unaddressed" ]; then
    echo "- Unaddressed failing reviews (IDs: $unaddressed) — inspect each with \`roborev show --job <id>\`, then either:"
    echo "    * fix the finding and run \`roborev close <id>\`, or"
    echo "    * if the finding is a false positive or intentional, leave a short explanation with \`roborev comment --job <id> \"<why>\"\` and then \`roborev close <id>\`."
  fi
  echo
  echo "Do not stop until every listed review is either fixed or explicitly closed with a comment."
} >&2

exit 2
