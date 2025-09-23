#!/usr/bin/env bash

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