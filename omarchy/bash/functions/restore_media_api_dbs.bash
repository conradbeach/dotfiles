#!/usr/bin/env bash

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