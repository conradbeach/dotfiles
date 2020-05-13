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
brew cask install chromedriver
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
brew install mas
brew install neovim
brew install pinentry-mac
brew install python
brew tap thoughtbot/formulae && brew install rcm
brew install ripgrep
brew install speedtest-cli
brew install the_silver_searcher
brew install tldr
brew install tmux
brew install trash
brew install tree
brew cask install virtualbox && brew cask install vagrant && brew cask install vagrant-manager
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


# Link Files
echo "\n** Symlinking Files **"
ln -s ~/Development/dotfiles/nvim ~/.config
ln -s ~/Development/dotfiles/.circleci ~
mkdir ~/.ssh
rm ~/.ssh/config
ln -s ~/Development/dotfiles/ssh/config ~/.ssh/
rm ~/.ssh/known_hosts
ln -s ~/Development/dotfiles/ssh/known_hosts ~/.ssh/
ln -s ~/Development/dotfiles/tmuxinator ~/.config
ln -s ~/Development/dotfiles/.agignore ~
ln -s ~/Development/dotfiles/.asdfrc ~
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
ln -s ~/Development/dotfiles/git-commit-template.txt ~


# asdf
echo "\n** Installing asdf **"
rm -rf ~/.asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
source ~/.zshrc

## Dependencies
echo "\n** Installing Dependencies **"
xcode-select --install

## Ruby
echo "\n** Installing Ruby **"
xcode-select --install
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
echo "\n** Installing Neovim Modules for Python **"
pip2 install neovim
pip3 install neovim

# Other Tools

## rupa/z
echo "\n** Installing z **"
curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/.oh-my-zsh/z.sh

## Tmuxinator
echo "\n** Installing Tmuxinator **"
curl https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -o ~/.tmuxinator.zsh

## tat
echo "\n** Installing tat **"
curl https://raw.githubusercontent.com/thoughtbot/dotfiles/master/bin/tat -o /usr/local/bin/tat && chmod +x /usr/local/bin/tat

## Tmux Plugin Manager
echo "\n** Installing Tmux Plugin Manager **"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## vim-anywhere
echo "\n** Installing vim-anywhere **"
brew install macvim
curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash
echo '/usr/local/opt/neovim-dot-app/bin/gnvim' > ~/.vim-anywhere/.path

## Other Other
echo "\n** Installing Other Various Tools **"
yarn global add emoj
yarn global add pure-prompt
yarn global add neovim
yarn global add prettier
yarn global add eslint


# Apps
echo "\n\nTODO: Run :checkhealth in Neovim."
echo "\nTODO: Run :PlugInstall in Neovim."
echo "\nTODO: Hit <prefix>+I in tmux to install plugins."
echo "\nTODO: Set vim-anywhere keybinding to Command-Option-V. (System Preferences > Keyboard > Shortcuts > Services > Vim Anywhere)"
echo "\nTODO: Symlink dotfiles/gitkraken/profile to ~/.gitkraken/profiles/???/"
echo "\nTODO: Generate new GPG key. (Using GitKraken is the easiest. GitHub has a good guide that works too.)"
echo "\nTODO: Generate new SSH key. (Use GitHub's guide: https://help.github.com/en/articles/about-ssh)"
echo "\nTODO: Add the new GPG and SSH keys to your GitHub account."
echo "\nTODO: Copy ~/.atom config folder from Time Machine backup onto this machine."
echo "\nTODO: Copy ~/Development folder from Time Machine backup onto this machine."
echo "\nTODO: Copy '~/VirtualBox VMs' folder from Time Machine backup onto this machine."
echo "\nTODO: Check if there are any other files you should copy from Time Machine. Shouldn't be."
echo "\nTODO: Turn on FileVault. Go through other MacOS settings as well."
echo "\n\nTODO: Install the following softwares."
echo "**************************************"
echo "* [ ] Atom"
echo "* [ ] Aware"
echo "* [ ] Balena Etcher"
echo "* [ ] BetterTouchTool"
echo "    * Load license."
echo "    * Load keybindings."
echo "* [ ] Bitwarden"
echo "* [ ] Brave Browser"
echo "* [ ] CopyClip2"
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
echo "    * Load config from this repo."
echo "* [ ] Jabra Direct"
echo "* [ ] Kap"
echo "* [ ] Keka"
echo "* [ ] KeyboardCleanTool"
echo "* [ ] Lacona"
echo "    * Change keybinding to command-space."
echo "    * Change Spotlight keybinding to option-space. (In Settings > Keyboard > Shortcuts > Spotlight"
echo "    * Install addons: Caffeniate, Convert Currency, GitHub, Shell Commands, Time Zones, Timers & Alarms."
echo "* [ ] Noizio (Mac App Store)"
echo "* [ ] Numi"
echo "* [ ] Oni"
echo "* [ ] Postman"
echo "    * Login to get saved API calls."
echo "* [ ] ProtonVPN"
echo "* [ ] Slack"
echo "* [ ] Snip (Mac App Store)"
echo "    * Set shortcut to command-control-n"
echo "* [ ] Sophos Home (Log into your Sophos.com dashboard to install.)"
echo "* [ ] Station"
echo "    * Gmail (Atomic Jolt)"
echo "    * Harvest"
echo "    * Slack (thebetterbeachhouse, logandevs, atomic-jolt)"
echo "    * GitHub"
echo "    * GitLab"
echo "    * Pivotal Tracker"
echo "    * Google Drive (Atomic Jolt)"
echo "    * Google Calendar (Atomic Jolt)"
echo "    * Trello"
echo "    * ProtonMail"
echo "* [ ] TablePlus"
echo "* [ ] Terminal.app"
echo "    * Load theme."
echo "    * In Settings > General, set custom theme to be the default."
echo "    * In Settings > General, change 'Shells open with:' to '/bin/zsh'."
echo "* [ ] VirtualBox"
echo "    * Install Extension Pack"
echo "* [ ] Visual Studio Code"
echo "* [ ] VLC"
echo "* [ ] Xcode (Just install the full application even though it's massive.)"
echo "* [ ] brew tap rogual/neovim-dot-app && brew install neovim-dot-app" # Requires Xcode
echo "* [ ] Zoom"
