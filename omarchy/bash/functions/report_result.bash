#!/usr/bin/env bash

# Reports the result of a command with a checkmark or X
# $1 - The name of the check
# $2 - The status code to check
report_result() {
  echo "$1: $([ $2 = 0 ] && echo "✅ Passed" || echo "❌ Failed")"
}