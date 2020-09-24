#!/bin/bash

# Brew
echo "\n** Installing Brew **"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Packages
echo "\n** Installing Brew Packages **"
brew install ack
brew install asciinema
brew install bat
brew tap homebrew/cask
brew install circleci
brew install cmake
brew install ctags
brew install diff-so-fancy
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install git
brew tap heroku/brew && brew install heroku
brew install htop
brew install httpie
brew install neovim
brew install pinentry-mac
brew install python
brew tap thoughtbot/formulae && brew install rcm
brew install ripgrep
brew install speedtest-cli
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install tmuxinator
brew install trash
brew install tree
brew cask install vagrant
brew install yarn
brew install zsh

## Fonts
echo "\n** Installing Brew Fonts **"
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

## Services
echo "\n** Installing Brew Services **"
brew install postgresql
brew services start postgresql

## Applications
echo "\n** Installing Applications via Brew Cask**"
brew cask install aware
brew cask install balenaetcher
brew cask install bettertouchtool
brew cask install bitwarden
brew cask install copyclip
brew cask install dash
brew cask install dropbox
brew cask install firefox
brew cask install homebrew/cask-versions/firefox-developer-edition
brew cask install gimp
brew cask install gitkraken
brew cask install google-chrome
brew cask install marshallofsound-google-play-music-player
brew cask install handbrake
brew cask install iterm2
brew cask install homebrew/cask-drivers/jabra-direct
brew cask install kap
brew cask install keyboardcleantool
brew cask install lacona
brew cask install numi
brew cask install oni
brew cask install postman
brew cask install protonvpn
brew cask install slack
brew cask install snip
brew cask install tableplus
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
brew cask install vlc

# Link Files
echo "\n** Symlinking Files **"
ln -s ~/Development/dotfiles/nvim ~/.config
ln -s ~/Development/dotfiles/.circleci ~
mkdir ~/.ssh/
rm ~/.ssh/config
ln -s ~/Development/dotfiles/ssh/config ~/.ssh/
rm ~/.ssh/known_hosts
ln -s ~/Development/dotfiles/ssh/known_hosts ~/.ssh/
ln -s ~/Development/dotfiles/tmuxinator ~/.config
ln -s ~/Development/dotfiles/.agignore ~
ln -s ~/Development/dotfiles/.asdfrc ~
ln -s ~/Development/dotfiles/.ctags ~
ln -s ~/Development/dotfiles/.default-gems ~
ln -s ~/Development/dotfiles/.default-npm-packages ~
rm ~/.fzf.zsh
ln -s ~/Development/dotfiles/.fzf.zsh ~
ln -s ~/Development/dotfiles/.gitconfig ~
ln -s ~/Development/dotfiles/.gitignore_global ~
ln -s ~/Development/dotfiles/.ideavimrc ~
ln -s ~/Development/dotfiles/.irbrc ~
ln -s ~/Development/dotfiles/.psqlrc ~
ln -s ~/Development/dotfiles/.reek.yml ~
ln -s ~/Development/dotfiles/.rspec ~
ln -s ~/Development/dotfiles/.rubocop.yml ~
ln -s ~/Development/dotfiles/.tmux.conf ~
ln -s ~/Development/dotfiles/.tool-versions ~
ln -s ~/Development/dotfiles/.vimrc ~
rm ~/.zsh_history
ln -s ~/Development/dotfiles/.zsh_history ~
rm ~/.zshrc
ln -s ~/Development/dotfiles/.zshrc ~
ln -s ~/Development/dotfiles/robbyrussell-altered-by-conrad.zsh-theme ~/.oh-my-zsh/themes
mkdir ~/.gnupg/
ln -s ~/Development/dotfiles/gpg-agent.conf ~/.gnupg/
ln -s ~/Development/dotfiles/git-commit-template.txt ~
mkdir ~/.gitkraken
ln -s ~/Development/dotfiles/gitkraken/profiles/ ~/.gitkraken
ln -s ~/Development/dotfiles/gitkraken/service/ ~/.gitkraken
ln -s ~/Development/dotfiles/gitkraken/config ~/.gitkraken

# asdf
echo "\n** Installing asdf **"
rm -rf ~/.asdf
brew install asdf
source ~/.zshrc

## Dependencies
echo "\n** Installing Dependencies **"
xcode-select --install
brew install coreutils curl git

## Ruby
echo "\n** Installing Ruby **"
brew install openssl libyaml libffi
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

## Erlang
echo "\n** Installing Erlang **"
brew install autoconf wxmac
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

## Elixir
echo "\n** Installing Elixir **"
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

## NodeJS
echo "\n** Installing NodeJS **"
brew install coreutils gpg
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

## Java
echo "\n** Installing Java **"
brew install jq
brew install coreutils
asdf plugin-add java https://github.com/halcyon/asdf-java.git

## Elasticsearch
echo "\n** Installing Elasticsearch **"
asdf plugin-add elasticsearch https://github.com/mikestephens/asdf-elasticsearch.git

## PostgreSQL
### The primary installation of Postgres is done with Brew. Alternative versions
### are installed with asdf.
echo "\n** Installing PostgreSQL **"
asdf plugin-add postgres

## Install Global Versions
echo "\n** Installing All Global Versions of Languages **"
asdf install


# Zsh

## Oh My Zsh
echo "\n** Installing Oh My Zsh **"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## zsh-git-prompt
echo "\n** Installing zsh-git-prompt **"
mkdir ~/.oh-my-zsh/zsh-git-prompt
curl https://raw.githubusercontent.com/olivierverdier/zsh-git-prompt/master/zshrc.sh -o ~/.oh-my-zsh/zsh-git-prompt/zshrc.sh

## zsh-syntax-highlighting
echo "\n** Installing zsh-syntax-highlighting **"
brew install zsh-syntax-highlighting

## zsh-completions
echo "\n** Installing zsh-completions **"
brew install zsh-completions

# Neovim

## vim-plug
echo "\n** Installing vim-plug **"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Python Support
echo "\n** Installing Neovim Package for Python **"
pip install neovim

# Other Tools

## rupa/z
echo "\n** Installing z **"
curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/.oh-my-zsh/z.sh

## Tmuxinator
echo "\n** Installing Tmuxinator Completions **"
curl https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -o ~/.tmuxinator.zsh

## tat
echo "\n** Installing tat **"
curl https://raw.githubusercontent.com/thoughtbot/dotfiles/master/bin/tat -o /usr/local/bin/tat && chmod +x /usr/local/bin/tat

## Tmux Plugin Manager
echo "\n** Installing Tmux Plugin Manager **"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## xcode-select
echo "\n** Installing Xcode Command Line Tools **"
xcode-select --install

# Other Development Setup
## SSH
echo "\n** Generating an SSH key **"
ssh-keygen -t rsa -b 4096 -C "conradbeach@protonmail.com"
eval "$(ssh-agent -s)"
echo "\nrun 'pbcopy < ~/.ssh/id_rsa.pub' and paste it into GitHub and GitLab"

## Project Repos
echo "\n** Cloning Project Repos **"
echo "\nThis step requires you to add your new SSH key to GitHub and GitLab."
read -p "Press [Enter] to confirm you've done this."
git clone git@gitlab.com:atomicjolt/act.git ~/Development/atomicjolt/act
git clone git@github.com:atomicjolt/adhesion.git ~/Development/atomicjolt/adhesion
git clone git@gitlab.com:atomicjolt/learnosity.git ~/Development/atomicjolt/learnosity
git clone git@github.com:atomicjolt/lti_starter_app.git ~/Development/atomicjolt/lti_starter_app
git clone git@gitlab.com:atomicjolt/microsoft-integrations.git ~/Development/atomicjolt/microsoft-integrations
git clone git@gitlab.com:atomicjolt/socialize.git ~/Development/atomicjolt/socialize
git clone git@gitlab.com:therapymate/therapymate.git ~/Development/atomicjolt/therapymate
git clone git@github.com:conradbeach/conradbeach.github.io.git ~/Development/conradbeach.github.io
git clone git@github.com:conradbeach/food-storage-inventory.git ~/Development/food-storage-inventory
git clone git@github.com:conradbeach/temperature_alert.git ~/Development/temperature_alert

# MacOS Settings
## Example settings: https://github.com/mathiasbynens/dotfiles/blob/master/.macos
## More examples: https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
echo "\n** Updating MacOS Settings**"
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

## Show the ~/Library folder.
chflags nohidden ~/Library

## Wipe all (default) app icons from the Dock.
defaults write com.apple.dock persistent-apps -array

## Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

## Don’t automatically rearrange Spaces based on most recent use.
defaults write com.apple.dock mru-spaces -bool false

## Show hidden files in finder.
defaults write com.apple.finder AppleShowAllFiles -string YES

# Show filename extensions. (Finder > Preferences > Show all filename extensions)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don't show warning when changing filename extension. (Finder > Preferences > Show warning before changing an extension)
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Don't show warning when removing file from iCloud Drive. (Finder > Preferences > Show warning before removing from iCloud Drive)
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Set default view to list. (Finder > View > As List)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the path bar in finder. (Finder > View > Show Path Bar)
defaults write com.apple.finder ShowPathbar -bool true

## Set dock size. (System Preferences > Dock > Size)
defaults write com.apple.dock tilesize -int 30

# Key repeat speed. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain KeyRepeat -int 2

# Delay until key repeat. (System Preferences > Keyboard. This is as fast as it will go.)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Kill Dock and Finder
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Manual Setup
echo "\n\n**************************************"
echo "\nTODO: Go through MacOS settings and update as needed."
echo "\nTODO: Turn on FileVault especially."
echo "\nTODO: Change 'Favorites' sidebar list to: home folder, Development, Downloads, Applications, Air Drop."
echo "\nTODO: Change 'Locations' sidebar list to: Conrad's MacBook Pro, Network"
echo "\nTODO: Next time you do this. Make a note here in this script of everything that you change."
echo "\nTODO: This article tells how to determine changes being made: https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/#the-way-to-find-the-domain--key-responsible-for-a-setting"
echo "    * Change default web browser to Firefox Developer Edition. (In Settings > General.)"
echo "    * Change Appearance to Dark. (In Settings > General.)"
echo "    * Change Spotlight keybinding to option-space. (In Settings > Keyboard Shortcuts > Spotlight.)"

echo "\n\nTODO: Run :checkhealth in Neovim."
echo "\nTODO: Run :PlugInstall in Neovim."
echo "\nTODO: Hit <prefix>+I in tmux to install plugins."
echo "\nTODO: Generate new GPG key. (Using GitKraken is the easiest.)"
echo "\nTODO: Add the new GPG key to your GitHub and GitLab accounts."
echo "\nTODO: Update your Atomic Jolt wiki page with your new SSH and GPG keys."
echo "\nTODO: Copy '~/VirtualBox VMs' folder from Time Machine backup onto this machine."
echo "\nTODO: Copy '~/Downloads' folder from Time Machine backup onto this machine."

echo "\n\nTODO: Make the following changes to applications."
echo "* [ ] BetterTouchTool"
echo "    * Load license. (In iCloud Drive > Software Licenses and Such.)"
echo "    * Load configuration. (In this repo.)"
echo "* [ ] CopyClip2"
echo "    * Change keyboard shortcut to Ctrl-Space"
echo "    * Load license. (In iCloud Drive > Software Licenses and Such.)"
echo "    * Update other settings."
echo "* [ ] Dash"
echo "    * Load License (In iCloud Drive > Software Licenses and Such.)"
echo "    * Set up syncing. Sync files are in iCloud Drive > Dash Sync."
echo "* [ ] Dropbox"
echo "    * Sign in with your Atomic Jolt account."
echo "* [ ] iTerm"
echo "    * Load configuration. (In this repo.)"
echo "* [ ] Lacona"
echo "    * Change keybinding to command-space."
echo "    * Install addons: Caffeniate, Convert Currency, Time Zones, Timers & Alarms."
echo "* [ ] Snip"
echo "    * Set shortcut to command-control-n"
echo "* [ ] Sophos Home"
echo "    * Log into you dashboard to install it."
echo "* [ ] Terminal.app"
echo "    * Load theme. (Dracula.theme in this repo.)"
echo "    * In Settings > General, set custom theme to be the default."
echo "    * In Settings > General, change 'Shells open with:' to '/bin/zsh'."
echo "* [ ] Vimac"
echo "    * Install it. (https://github.com/dexterleng/vimac/)"
echo "    * Set to launch at login."
echo "    * Change Hint Mode shortcut to ctl-f, set custom characters to 'asdfghjkl', set text size to 12."
echo "    * Change Scroll Mode shortcut to ctl-shift-s."

echo "\n\nRESTART: Some changes will require a restart before taking effect."
