# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Technologies
- Primarily shell scripts, Lua (Neovim configuration), and configuration files
- Also includes Ruby on Rails expertise

## Commands
- No formal test/build system, repository is primarily dotfiles
- For Neovim: `nvim --headless -c 'quitall'` to initialize plugins

## Style Guidelines
- Shell scripts: Use functions for reusable code blocks
- Include comments for non-obvious operations
- Follow modern Ruby and Rails conventions when editing Ruby code
- Use descriptive variable names and prioritize readability
- Maintain the existing style of each file type
- Keep code simple and maintainable over clever optimizations
- Ensure security best practices in all configurations
- Prefer built-in language features over complex custom solutions

## Code Organization
- Config files are symlinked from this repo to their system locations
- Follow existing directory structure and naming conventions

## Setup Script
- `mac_setup.sh` is the canonical setup script for a new machine
- Whenever adding tools, MCP servers, plugins, or other dependencies to the dotfiles, update `mac_setup.sh` so new machines get the same setup.
