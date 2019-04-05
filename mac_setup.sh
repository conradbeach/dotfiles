#!/bin/bash

# Dotfiles
ln -s ~/Development/dotfiles/nvim ~/.config
ln -s ~/Development/dotfiles/ssh/config ~/.ssh
ln -s ~/Development/dotfiles/ssh/known_hosts ~/.ssh
ln -s ~/Development/dotfiles/tmuxinator ~/.config
ln -s ~/Development/dotfiles/.agignore ~
ln -s ~/Development/dotfiles/.asdfrc ~
ln -s ~/Development/dotfiles/.ctags ~
ln -s ~/Development/dotfiles/.default-gems ~
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
ln -s ~/Development/dotfiles/.zshrc ~
ln -s ~/Development/dotfiles/robbyrussell-altered-by-conrad.zsh-theme ~/.oh-my-zsh/themes
ln -s ~/Development/dotfiles/gpg-agent.conf ~/.gnupg/

curl https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -o ~/.tmuxinator.zsh

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Packages
brew install ack
brew install asciinema
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
brew install pinentry-mac
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

## Fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

## Services
brew install postgresql
brew services start postgresql


# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.0

## Ruby
xcode-select --install
brew install openssl libyaml libffi
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

## Erlang
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
brew install autoconf wxmac

## Elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git


# Other Tools
npm install -g emoj
npm install --global pure-prompt


# Apps
echo "TODO: Install the following softwares."
echo "**************************************"
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
echo "* [ ] Emacs (from https://emacsforosx.com/)"
echo "    * Add evil-mode which will give you excellent Vim emulation"
echo "    * Consider prelude (https://github.com/bbatsov/prelude/)"
echo "    * Consider spacemacs (spacemacs.org)"
echo "    * The guys at thoughtbot recommend against starting with prelude or spacemacs; they think it's better to learn core Emacs first. One of them wrote sensible-defaults.el though which fixes some of the clunkiness that Emacs comes with out of the box. https://github.com/hrs/sensible-defaults.el"
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
