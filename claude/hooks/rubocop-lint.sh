#!/bin/bash
# Runs RuboCop on a Ruby file after it's edited/written by Claude Code.
# Provides immediate feedback on style violations.

FILE_PATH=$(jq -r '.tool_input.file_path' < /dev/stdin)

if [[ ! -f "$FILE_PATH" ]]; then
  exit 0
fi

# Use bundle exec if project has rubocop in its bundle
if [[ -f "Gemfile.lock" ]] && grep -q 'rubocop' Gemfile.lock 2>/dev/null; then
  bundle exec rubocop "$FILE_PATH" --format simple --no-color 2>&1
elif command -v rubocop &>/dev/null; then
  rubocop "$FILE_PATH" --format simple --no-color 2>&1
fi
