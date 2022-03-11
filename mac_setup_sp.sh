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
ln -sf ~/Development/dotfiles/nvim ~/.config
mkdir ~/.ssh/
ln -sf ~/Development/dotfiles/ssh/config ~/.ssh/
ln -sf ~/Development/dotfiles/tmuxinator ~/.config
ln -sf ~/Development/dotfiles/.agignore ~
ln -sf ~/Development/dotfiles/.ctags ~
ln -sf ~/Development/dotfiles/.fzf.zsh ~
ln -sf ~/Development/dotfiles/.gitconfig_sp ~/.gitconfig
ln -sf ~/Development/dotfiles/.gitignore_global ~
ln -sf ~/Development/dotfiles/.ideavimrc ~
ln -sf ~/Development/dotfiles/.irbrc ~
ln -sf ~/Development/dotfiles/.reek.yml ~
ln -sf ~/Development/dotfiles/.rspec ~
ln -sf ~/Development/dotfiles/.rubocop.yml ~
ln -sf ~/Development/dotfiles/.tmux.conf ~
ln -sf ~/Development/dotfiles/.vimrc ~ 
ln -sf ~/Development/dotfiles/.zshrc ~
# gpg-agent.conf is linked later on this script because gnupg sets up the ~/.gnupg directory
# in a certain way, so I need to link this file after gnupg runs once.
ln -sf ~/Development/dotfiles/git-commit-template.txt ~

# Brew
print_header "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
source ~/.zshrc

## Packages
print_header "Installing Brew Packages"
brew install ack
brew install bat
brew tap homebrew/cask
brew install cmake
brew install ctags
brew install diff-so-fancy
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
brew install git
brew install gnupg
brew install jq
brew install neovim
brew install pinentry-mac
brew install pure
brew install rbenv
brew install ripgrep
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install tmuxinator
brew install trash
brew install yarn
brew install zsh

## Fonts
print_header "Installing Brew Fonts"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

## Applications
print_header "Installing Applications via Brew Cask"
brew install --cask alfred
brew install --cask copyclip
brew install --cask dash
brew install --cask firefox
brew install --cask gitkraken
brew install --cask iterm2
brew install --cask postman
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

## NodeJS
print_header "Installing NodeJS"
brew install coreutils gpg
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

## vim-plug
print_header "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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
ssh-keygen -t ed25519 -C "conrad.beach@simplepractice.com"
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste it into GitHub"

## gnupg
gnupg --list-keys
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

# Set default view to list. (Finder > View > As List)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the path bar in finder. (Finder > View > Show Path Bar)
defaults write com.apple.finder ShowPathbar -bool true

## Set dock size. (System Preferences > Dock > Size)
defaults write com.apple.dock tilesize -int 24

# Key repeat speed. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain KeyRepeat -int 2

# Delay until key repeat. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Kill Dock and Finder
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

print_header "Final Steps"
echo "Perform manual setup steps in mac_setup_manual_steps_sp.md"
echo "Restart your computer. Some changes won't take affect until you do."
