#!/bin/bash

# This script is meant to be idempotent and should be safe to run multiple times.

function print_header() {
  echo "**************************************************************************"
  echo "**" $1
  echo "**************************************************************************"
}


# Rosetta 2
print_header "Installing Rosetta 2"
sudo softwareupdate --install-rosetta


# Link Files
print_header "Symlinking Files"
mkdir ~/.config
ln -sf ~/Development/dotfiles/nvim ~/.config
ln -sf ~/Development/dotfiles/lunarvim/config.lua ~/.config/lvim
mkdir ~/.ssh/
ln -sf ~/Development/dotfiles/ssh/config ~/.ssh/
ln -sf ~/Development/dotfiles/ssh/known_hosts ~/.ssh/
ln -sf ~/Development/dotfiles/tmuxinator ~/.config
ln -sf ~/Development/dotfiles/.agignore ~
ln -sf ~/Development/dotfiles/.asdfrc ~
ln -sf ~/Development/dotfiles/.ctags ~
ln -sf ~/Development/dotfiles/.default-gems ~
ln -sf ~/Development/dotfiles/.default-npm-packages ~
ln -sf ~/Development/dotfiles/.fzf.zsh ~
ln -sf ~/Development/dotfiles/.gitconfig ~
ln -sf ~/Development/dotfiles/.gitignore_global ~
ln -sf ~/Development/dotfiles/.ideavimrc ~
ln -sf ~/Development/dotfiles/.irbrc ~
ln -sf ~/Development/dotfiles/.pryrc ~
ln -sf ~/Development/dotfiles/.psqlrc ~
ln -sf ~/Development/dotfiles/.reek.yml ~
ln -sf ~/Development/dotfiles/.rspec ~
ln -sf ~/Development/dotfiles/.rubocop.yml ~
ln -sf ~/Development/dotfiles/.tmux.conf ~
ln -sf ~/Development/dotfiles/.tool-versions ~
ln -sf ~/Development/dotfiles/.vimrc ~ 
ln -sf ~/Development/dotfiles/.zshrc ~
# gpg-agent.conf is linked later on this script because gnupg sets up the ~/.gnupg directory
# in a certain way, so I need to link this file after gnupg runs once.
ln -sf ~/Development/dotfiles/git-commit-template.txt ~


# Brew
print_header "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
source ~/.zshrc

eval "$(/opt/homebrew/bin/brew shellenv)"

## Packages
print_header "Installing Brew Packages"
brew install ack
brew install asciinema
brew install bat
brew tap homebrew/cask
brew install cmake
brew install ctags
brew install diff-so-fancy
brew install exa
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
brew install git
brew install gnupg
brew tap heroku/brew && brew install heroku
brew install htop
brew install httpie
brew install java
brew install jq
brew install neovim
brew install pinentry-mac
brew install pure
brew install python
brew tap thoughtbot/formulae && brew install rcm
brew install ripgrep
brew install rust
brew install speedtest-cli
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install tmuxinator
brew install trash
brew install tree
brew install yarn
brew install zsh

## Services
print_header "Installing Brew Services"
brew install redis
brew services start redis

## Fonts
print_header "Installing Brew Fonts"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

## Applications
print_header "Installing Applications via Brew Cask"
brew install --cask aware
brew install --cask balenaetcher
brew install --cask bettertouchtool
brew install --cask bitwarden
brew install --cask brave-browser
brew install --cask coconutbattery
brew install --cask dash
brew install --cask discord
brew install --cask firefox
brew install --cask homebrew/cask-versions/firefox-developer-edition
brew install --cask gimp
brew install --cask gitkraken
brew install --cask google-chrome
brew install --cask handbrake
brew install --cask iterm2
brew install --cask kap
brew install --cask keyboardcleantool
brew install --cask krisp
brew install --cask maccy
brew install --cask numi
brew install --cask obsidian
brew install --cask postgres-unofficial
brew install --cask postman
brew install --cask protonvpn
brew install --cask slack
brew install --cask tableplus
brew install --cask vagrant
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask visual-studio-code


# asdf
print_header "Installing asdf"
rm -rf ~/.asdf
brew install asdf
source ~/.zshrc

## Dependencies
print_header "Installing Dependencies"
xcode-select --install
brew install coreutils curl git

## Ruby
print_header "Installing Ruby"
brew install openssl libyaml libffi
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

## Erlang
print_header "Installing Erlang"
brew install autoconf wxmac
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

## Elixir
print_header "Installing Elixir"
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

## NodeJS
print_header "Installing NodeJS"
brew install coreutils gpg
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

## Elasticsearch
print_header "Installing Elasticsearch"
asdf plugin-add elasticsearch https://github.com/mikestephens/asdf-elasticsearch.git

## Install Global Versions
print_header "Installing All Global Versions of Languages"
asdf install


# Zsh

## Oh My Zsh
print_header "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

## zsh-syntax-highlighting
print_header "Installing zsh-syntax-highlighting"
brew install zsh-syntax-highlighting

## zsh-completions
print_header "Installing zsh-completions"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions


# Neovim/LunarVim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh) --yes


# Other Tools

## rupa/z
print_header "Installing z"
curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/.oh-my-zsh/z.sh

## tat
print_header "Installing tat"
sudo curl https://raw.githubusercontent.com/thoughtbot/dotfiles/master/bin/tat -o /usr/local/bin/tat && sudo chmod +x /usr/local/bin/tat

## Tmux Plugin Manager
print_header "Installing Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## xcode-select
print_header "Installing Xcode Command Line Tools"
xcode-select --install


# Other Development Setup

## SSH
print_header "Generating an SSH key"
ssh-keygen -t ed25519 -C "conradbeach@protonmail.com"
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste it into GitHub and GitLab"

## gnupg
gpg --list-keys
ln -sf ~/Development/dotfiles/gpg-agent.conf ~/.gnupg/


# MacOS Settings

## Example settings: https://github.com/mathiasbynens/dotfiles/blob/master/.macos
## More examples: https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
print_header "Updating MacOS Setting"
## Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

## Disable the “Are you sure you want to open this application?” dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

## Avoid creating .DS_Store files on network or USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## Disable the warning before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool false

## Show hidden files in finder.
defaults write com.apple.finder AppleShowAllFiles -string YES

## Set default view to list. (Finder > View > As List)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

## Show the path bar in finder. (Finder > View > Show Path Bar)
defaults write com.apple.finder ShowPathbar -bool true

## Set dock size. (System Preferences > Dock > Size)
defaults write com.apple.dock tilesize -int 24

## Key repeat speed. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain KeyRepeat -int 2

## Delay until key repeat. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

## Kill Dock and Finder
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done


# Final Steps

print_header "Final Steps"
echo "Perform manual setup steps in mac_setup_manual_steps.md"
echo "Restart your computer. Some changes won't take affect until you do."
