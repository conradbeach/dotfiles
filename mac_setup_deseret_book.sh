#!/bin/bash

# This script is meant to be idempotent and should be safe to run multiple times.

function print_header() {
  echo "**************************************************************************"
  echo "**" $1
  echo "**************************************************************************"
}


# Link Files
print_header "Symlinking Files"
mkdir ~/.config
mkdir ~/.config/solargraph
mkdir ~/.ssh/
ln -sf ~/development/dotfiles/ssh/config ~/.ssh/
ln -sf ~/development/dotfiles/tmuxinator ~/.config
ln -sf ~/development/dotfiles/.agignore ~
ln -sf ~/development/dotfiles/.asdfrc ~
ln -sf ~/development/dotfiles/.ctags ~
ln -sf ~/development/dotfiles/.default-gems ~
ln -sf ~/development/dotfiles/.default-npm-packages ~
ln -sf ~/development/dotfiles/.fzf.zsh ~
ln -sf ~/development/dotfiles/.gitconfig ~
ln -sf ~/development/dotfiles/.gitignore_global ~
ln -sf ~/development/dotfiles/.irbrc ~
ln -sf ~/development/dotfiles/.pryrc ~
ln -sf ~/development/dotfiles/.psqlrc ~
ln -sf ~/development/dotfiles/.reek.yml ~
ln -sf ~/development/dotfiles/.rspec ~
ln -sf ~/development/dotfiles/.rubocop.yml ~
ln -sf ~/development/dotfiles/.solargraph.yml ~/.config/solargraph/config.yml
ln -sf ~/development/dotfiles/.tmux.conf ~
ln -sf ~/development/dotfiles/.tool-versions ~
ln -sf ~/development/dotfiles/.zshrc ~
ln -sf ~/development/dotfiles/git-commit-template.txt ~
# gpg-agent.conf is linked later on this script because gnupg sets up the ~/.gnupg directory
# in a certain way, so I need to link this file after gnupg runs once.


# Brew
print_header "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

eval "$(/opt/homebrew/bin/brew shellenv)"

## Packages
print_header "Installing Brew Packages"
brew install ack
brew install bat
brew install cmake
brew install ctags
brew install diff-so-fancy
brew install exa
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
brew install git
brew install gnupg
brew install gnu-sed
brew install imagemagick
brew install neovim
brew install pinentry-mac
brew install pure
brew install python
brew install ripgrep
brew install rust
brew install spacer
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install tmuxinator
brew install trash
brew install wget
brew install yarn
brew install zsh

## Services
print_header "Installing Brew Services"
brew install redis
brew services start redis

## Fonts
print_header "Installing Brew Fonts"
brew install --cask font-hack-nerd-font

## Applications
print_header "Installing Applications via Brew Cask"
brew install --cask bettertouchtool
brew install --cask bitwarden
brew install --cask dash
brew install --cask homebrew/cask-versions/firefox-developer-edition
brew install --cask gitkraken
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask numi
brew install --cask obsidian
brew install --cask postgres-unofficial
brew install --cask postman
brew install --cask tableplus
brew install --cask visual-studio-code

# Cargo
print_header "Installing Cargo Packages"
cargo install faketty

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
brew install openssl@3 readline libyaml gmp
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

## NodeJS
print_header "Installing NodeJS"
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

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


# Neovim
git clone --depth 1 --branch v3.45.3 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -sf ~/development/dotfiles/nvim/lua/user ~/.config/nvim/lua/
nvim  --headless -c 'quitall'

pip3 install pynvim


# Other Tools

## tat
print_header "Installing tat"
sudo mkdir /usr/local/bin
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
ssh-keygen -t ed25519 -C "conradbeach@hey.com"
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

## gnupg
gpg --list-keys
ln -sf ~/development/dotfiles/gpg-agent.conf ~/.gnupg/


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

## Don't show warning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

## Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## Don't show warning before changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Show hidden files in finder.
defaults write com.apple.finder AppleShowAllFiles -string YES

## Keep folders on top in windows when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

## Set default view to list. (Finder > View > As List)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

## Show the path bar in finder. (Finder > View > Show Path Bar)
defaults write com.apple.finder ShowPathbar -bool true

## Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
## Possible values: `WhenScrolling`, `Automatic` and `Always`

## Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain AppleScrollerPagingBehavior -bool true

## Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

## Don't show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool false

## Set dock size. (System Preferences > Dock > Size)
defaults write com.apple.dock tilesize -int 24

## Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

## Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

## Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

## Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

## Hide Input Menu in menu bar
defaults write "com.apple.controlcenter" "NSStatusItem Visible InputMenu" -bool false

## Key repeat speed. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain KeyRepeat -int 2

## Delay until key repeat. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

## Enable key repeat in VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

## Kill Dock and Finder
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done


# Final Steps

print_header "Final Steps"
echo "Perform manual setup steps in mac_setup_manual_steps_db.md"
echo "Restart your computer. Some changes won't take affect until you do."
