#!/bin/bash

# This script is meant to be idempotent and should be safe to run multiple times.
#
# To install Deseret Book tooling, set the DESERET_BOOK environment variable.
# e.g. DESERET_BOOK=true ./mac_setup.sh

function print_header() {
  echo "**************************************************************************"
  echo "**" $1
  echo "**************************************************************************"
}

# Omarchy
print_header "Symlinking Omarchy Config"
ln -sfn ~/development/dotfiles/omarchy/hypr/autostart.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/bindings.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/envs.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hypridle.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hyprland.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hyprlock.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hyprsunset.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/input.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/monitors.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/windows.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/alacritty.toml ~/.config/alacritty/
ln -sfn ~/development/dotfiles/omarchy/.gitconfig ~

# zsh
yay -Sy --noconfirm --needed zsh
ln -sfn ~/development/dotfiles/zsh/.zshrc ~
ln -sfn ~/development/dotfiles/.fzf.zsh ~

# Git
ln -sfn ~/development/dotfiles/omarchy/.gitconfig ~
ln -sfn ~/development/dotfiles/.gitignore_global ~
ln -sfn ~/development/dotfiles/git-commit-template.txt ~

# asdf
ln -sfn ~/development/dotfiles/.asdfrc ~
ln -sfn ~/development/dotfiles/.default-gems ~
ln -sfn ~/development/dotfiles/.default-npm-packages ~
ln -sfn ~/development/dotfiles/.tool-versions ~

## Ruby
ln -sfn ~/development/dotfiles/.irbrc ~
ln -sfn ~/development/dotfiles/.pryrc ~
ln -sfn ~/development/dotfiles/.rspec ~

# Postgres
ln -sfn ~/development/dotfiles/.psqlrc ~

# tmux
ln -sfn ~/development/dotfiles/.tmux.conf ~

# Neovim
ln -sfn ~/development/dotfiles/astronvim ~/.config/nvim
nvim  --headless -c 'quitall'

ln -sfn ~/development/dotfiles/.agignore ~
ln -sfn ~/development/dotfiles/.ripgreprc ~

# SSH
ssh-keygen -t ed25519 -C "conradbeach@hey.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ln -sf ~/development/dotfiles/omarchy/ssh/config ~/.ssh/
ln -sf ~/development/dotfiles/ssh/known_hosts ~/.ssh/

# Applications
print_header "Installing Applications"
yay -Sy --noconfirm --needed \
  firefox-developer-edition \
  gitkraken \
  postman-bin \
  tableplus \
  visual-studio-code-bin \
  zen-browser-bin

mkdir -p ~/Obsidian
ln -sfn ~/development/dotfiles/.obsidian.vimrc ~/Obsidian
