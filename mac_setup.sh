#!/bin/bash

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ack
brew install bat
brew install cmake
brew install diff-so-fancy
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install git
brew install heroku
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
brew install zsh
brew install zsh-completions

brew tap caskroom/fonts
brew cask install font-hack-nerd-font

brew install postgresql
brew services start postgresql
