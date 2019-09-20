#!/bin/bash

# Brew
echo "** Installing Brew **"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Packages
echo "** Installing Brew Packages **"
brew install ack
brew install asciinema
brew install bat
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
brew install mas
brew install neovim
# neovim-dot-app: A full installation of Xcode.app is required to compile this software. Installing just the Command Line Tools is not sufficient.
brew tap rogual/neovim-dot-app && brew install neovim-dot-app
brew install pinentry-mac
brew install python
brew install python@2
brew tap thoughtbot/formulae && brew install rcm
brew install ripgrep
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install trash
brew install tree
brew cask install virtualbox && brew cask install vagrant && brew cask install vagrant-manager
brew install yarn
brew install zsh

## Fonts
echo "** Installing Brew Fonts **"
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

## Services
echo "** Installing Brew Services **"
brew install postgresql
brew services start postgresql


# asdf
echo "** Installing asdf **"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.0

## Ruby
echo "** Installing Ruby **"
xcode-select --install
brew install openssl libyaml libffi
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.5.5

## Erlang
echo "** Installing Erlang **"
brew install autoconf wxmac
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

## Elixir
echo "** Installing Elixir **"
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

## NodeJS
echo "** Installing NodeJS **"
brew install coreutils gpg
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.3.1

# Zsh

## Oh My Zsh
echo "** Installing Oh My Zsh **"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## zsh-git-prompt
echo "** Installing zsh-git-prompt **"
mkdir ~/.oh-my-zsh/zsh-git-prompt
curl https://raw.githubusercontent.com/olivierverdier/zsh-git-prompt/master/zshrc.sh -o ~/.oh-my-zsh/zsh-git-prompt/zshrc.sh

## zsh-syntax-highlighting
echo "** Installing zsh-syntax-highlighting **"
brew install zsh-syntax-highlighting

## zsh-completions
echo "** Installing zsh-completions **"
brew install zsh-completions

# Neovim

## vim-plug
echo "** Installing vim-plug **"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Python Support
echo "** Installing Neovim Modules for Python **"
pip2 install neovim
pip3 install neovim

# Other Tools

## rupa/z
echo "** Installing z **"
curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/.oh-my-zsh/z.sh

## Tmuxinator
echo "** Installing Tmuxinator **"
curl https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -o ~/.tmuxinator.zsh

## tat
echo "** Installing tat **"
curl https://raw.githubusercontent.com/thoughtbot/dotfiles/master/bin/tat -o /usr/local/bin/tat && chmod +x /usr/local/bin/tat

## Tmux Plugin Manager
echo "** Installing Tmux Plugin Manager **"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## vim-anywhere
echo "** Installing vim-anywhere **"
curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash
echo '/usr/local/opt/neovim-dot-app/bin/gnvim' > ~/.vim-anywhere/.path

## Other Other
echo "** Installing Other Various Tools **"
yarn global add emoj
yarn global add pure-prompt
yarn global add neovim


# Link Files
echo "** Symlinking Files **"
ln -s ~/Development/dotfiles/nvim ~/.config
ln -s ~/Development/dotfiles/ssh/config ~/.ssh
rm ~/.ssh/known_hosts
ln -s ~/Development/dotfiles/ssh/known_hosts ~/.ssh
ln -s ~/Development/dotfiles/tmuxinator ~/.config
ln -s ~/Development/dotfiles/.agignore ~
ln -s ~/Development/dotfiles/.asdfrc ~
ln -s ~/Development/dotfiles/.circleci ~
ln -s ~/Development/dotfiles/.ctags ~
ln -s ~/Development/dotfiles/.default-gems ~
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


# Apps
echo ""
echo ""
echo "TODO: Run :checkhealth in Neovim."
echo ""
echo "TODO: Run :PlugInstall in Neovim."
echo ""
echo "TODO: Hit <prefix>+I in tmux to install plugins."
echo ""
echo "TODO: Set vim-anywhere keybinding to Command-Option-V. (System Preferences > Keyboard > Shortcuts > Services > Vim Anywhere)"
echo ""
echo "TODO: Symlink dotfiles/gitkraken/profile to ~/.gitkraken/profiles/???/"
echo ""
echo "TODO: Copy ~/.atom config folder from Time Machine backup onto this machine."
echo ""
echo "TODO: Copy ~/Development folder from Time Machine backup onto this machine."
echo ""
echo "TODO: Check if there are any other files you should copy from Time Machine. Shouldn't be."
echo ""
echo "TODO: Turn on FileVault. Go through other MacOS settings as well."
echo ""
echo "TODO: Install the following softwares."
echo "**************************************"
echo "* [ ] Neovim.app"
echo "* [ ] Atom"
echo "* [ ] Balena Etcher"
echo "* [ ] BetterTouchTool"
echo "    * Load license."
echo "    * Load keybindings."
echo "* [ ] Bitwarden"
echo "* [ ] Brave Browser"
echo "* [ ] CopyClip (Mac App Store)"
echo "* [ ] Dash"
echo "    * Load License"
echo "    * Load sync files (in iCloud)"
echo "    * Set up syncing. Sync files are in iCloud Drive > Dash Sync."
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
echo "    * Load config"
echo "* [ ] Kap"
echo "* [ ] Keka"
echo "* [ ] Kindle"
echo "* [ ] Lacona"
echo "    * Change keybinding to command-space."
echo "    * Change Spotlight keybinding to option-space. (In Settings > Keyboard > Shortcuts > Spotlight"
echo "    * Install addons: Caffeniate, Convert Currency, GitHub, Shell Commands, Timers & Alarms."
echo "* [ ] Noizio (Mac App Store)"
echo "* [ ] Numi"
echo "* [ ] Oni"
echo "* [ ] OnionShare"
echo "* [ ] Postman"
echo "    * Login to get saved API calls."
echo "* [ ] ProtonVPN"
echo "* [ ] Slack"
echo "* [ ] Snip (Mac App Store)"
echo "    * Set shortcut to command-control-a"
echo "* [ ] Sophos Home (Log into your dashboard to install.)"
echo "* [ ] Station"
echo "    * Gmail (Atomic Jolt)"
echo "    * Harvest"
echo "    * Slack (thebetterbeachhouse, logandevs, atomic-jolt)"
echo "    * GitHub"
echo "    * Pivotal Tracker"
echo "    * Google Drive (Atomic Jolt)"
echo "    * Google Calendar (Atomic Jolt)"
echo "    * Trello"
echo "    * ProtonMail"
echo "* [ ] TablePlus"
echo "* [ ] Terminal.app"
echo "    * Load theme."
echo "    * In Settings > General, set custom theme to be the default."
echo "    * In Settings > General, change 'Shells open with:' to 'bin/zsh'."
echo "* [ ] VirtualBox"
echo "    * Install Extension Pack"
echo "* [ ] Visual Studio Code"
echo "* [ ] VLC"
echo "* [ ] Xcode (Just install the full application even though it's massive.)"
