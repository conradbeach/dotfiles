#!/bin/bash

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Packages
brew install ack
brew install bat
brew install cmake
brew install ctags
brew install diff-so-fancy
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install git
brew install heroku
brew install htop
brew install mas
brew install neovim
brew tap rogual/neovim-dot-app
brew install neovim-dot-app
brew install python
brew install python@2
brew install rcm
brew install ripgrep
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install trash
brew install tree
brew install cask vagrant
brew install yarn
brew install zsh
brew install zsh-completions

npm install -g emoj

## Fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

## Services
brew install postgresql
brew services start postgresql

echo "TODO: Install the following softwares."
echo "**************************************"
echo "* [ ] DisplayLink macOS Driver"
echo "* [ ] Neovim.app"
echo "* [ ] Atom"
echo "* [ ] Balena Etcher"
echo "* [ ] BetterTouchTool"
echo "    * Load license."
echo "    * Load keybindings."
echo "* [ ] Brave Browser"
echo "* [ ] CopyClip"
echo "* [ ] Dash"
echo "    * Load License"
echo "    * Load sync files (in iCloud)"
echo "* [ ] Firefox Developer Edition"
echo "* [ ] Firefox"
echo "* [ ] GIMP"
echo "* [ ] GitKraken"
echo "* [ ] Google Chrome"
echo "* [ ] Google Play Music Desktop Player"
echo "* [ ] HandBrake"
echo "* [ ] iTerm"
echo "    * Load config "
echo "* [ ] Kap"
echo "* [ ] Keka"
echo "* [ ] Lacona"
echo "    * Change keybinding to command-space."
echo "    * Change Spotlight keybinding to option-space."
echo "    * Install addons: Caffeniate, Convert Currency, GitHub, Shell Commands, Timers & Alarms."
echo "* [ ] LastPass"
echo "* [ ] Noizio (Mac App Store)"
echo "* [ ] Numi"
echo "* [ ] Oni"
echo "* [ ] OnionShare"
echo "* [ ] Postman"
echo "    * Login to get saved API calls."
echo "* [ ] ProtonVPN"
echo "* [ ] RubyMine"
echo "* [ ] Slack"
echo "* [ ] Snip (Mac App Store)"
echo "* [ ] Sophos Home (Log into your dashboard to install.)"
echo "* [ ] Station"
echo "* [ ] TablePlus"
echo "* [ ] Terminal.app"
echo "    * Load theme."
echo "    * Set custom theme to be the default profile."
echo "    * In Settings > General, change 'Shells open with:' to zsh."
echo "* [ ] VirtualBox"
echo "    * Install Extension Pack"
echo "* [ ] Visual Studio Code"
echo "* [ ] VLC"
echo "* [ ] Xcode (Just install the full application even though it's massive.)"
