#!/bin/bash

# Focus-or-launch helper script for Hyprland
# Usage: 
#   focus-or-launch.sh class <class-name> <launch-command>
#   focus-or-launch.sh title <title-pattern> <launch-command>

mode="$1"
identifier="$2"
shift 2
launch_command="$@"

case "$mode" in
    "class")
        if hyprctl clients -j | jq -e ".[] | select(.class == \"$identifier\")" > /dev/null; then
            hyprctl dispatch focuswindow class:"$identifier"
        else
            $launch_command
        fi
        ;;
    "title")
        if hyprctl clients -j | jq -e ".[] | select(.title | test(\"$identifier\"; \"i\"))" > /dev/null; then
            # For patterns with multiple options, try to find the specific window
            if [[ "$identifier" == *"|"* ]]; then
                # Find the first matching title and focus on it
                matching_title=$(hyprctl clients -j | jq -r ".[] | select(.title | test(\"$identifier\"; \"i\")) | .title" | head -1)
                hyprctl dispatch focuswindow title:"$matching_title"
            else
                hyprctl dispatch focuswindow title:"$identifier"
            fi
        else
            $launch_command
        fi
        ;;
    *)
        echo "Usage: $0 {class|title} <identifier> <launch-command>"
        exit 1
        ;;
esac