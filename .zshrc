export ZSH=~/.oh-my-zsh # Path to your oh-my-zsh installation.

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="~/.local/bin:$PATH"

export SHELL="/bin/zsh"

# Track Your Hours
export LOCAL_IP=$(ifconfig | grep 'inet 192'| awk '{ print $2 }')
# export MAC_M1=true # I'm not using Docker for now, so this variable triggers the wrong testing config for Capybara.

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="" # Pure prompt handles the theme.

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

# User configuration

# Allow [ or ] whereever you want
unsetopt nomatch

# Don't verify commands with history expansion. Normally, I would prefer the
# extra safety this option offers, but I want to be able to easily run previous
# commands with vim-tmux-runner, so I'm turning it off.
unsetopt histverify

# With this set, zsh sessions will append their history list to the history file, rather than replace it. Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file, in the order that they exit.
setopt appendhistory

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Vi Mode (http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Keymaps-1)
bindkey -v # Change keybindings to vi.
bindkey '^?' backward-delete-char # By default, you can't backspace all text after changing from normal mode to insert mode. This changes it so you can.
export KEYTIMEOUT=1 # Sets the delay when switching between normal and insert mode. Default is 4 which is 0.4 seconds.

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='lvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases
## General
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias sed="sed -E"
alias help="tldr"
alias n="nvim"
alias k9="kill -9"
alias notes="cd ~/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents && lvim"
alias cl="clear"
alias src="source ~/.zshrc"
alias vg="vagrant"
alias restart_nginx="echo \"stopping nginx\" && sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist && echo \"starting nginx\" && sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist && echo \"nginx restarted\""
alias bs="brew services"
alias mux="tmuxinator"
alias ms="mux start"
alias home="cd && clear"
alias python="python3"
alias pip="pip3"
## Overrides (Remember that you can run the original command by prepending it with a \. e.g. `\cat` will run the real cat instead of bat.)
alias ls="exa --all --group-directories-first --icons"
alias cat="bat --theme=OneHalfLight"
alias top="htop"
alias find="fd -H"
## Ruby & Rails
alias cra="bundle exec rspec && bundle exec rubocop --display-style-guide && bundle exec bundler-audit check --update && bundle exec brakeman --no-pager && rubycritic app" # Short for 'check rails app'
alias crajs="bundle exec rspec && rails cypress:run && bundle exec rubocop --display-style-guide && yarn eslint app/javascript cypress && bundle exec bundler-audit check --update && bundle exec brakeman --no-pager && rubycritic app && yarn audit" # Short for 'check rails app with JS'
alias crs="bundle audit check --update && brakeman --no-pager" # Short for 'check Rails security'
alias be="bundle exec"
alias hr="heroku run"
alias ss="bundle exec spring stop"
alias rdm="bundle exec rails db:migrate"
alias rs="bundle exec spring stop && bundle exec rails server"
alias rc="bundle exec rails console"
alias sss="bundle exec spring stop; rake tmp:clear"
## Git
alias grm="git rebase master -i --autosquash"
alias grs="git rebase staging -i --autosquash"
alias gri="git rebase -i --autosquash"
alias grc="git rebase --continue"
alias gcf="git commit --fixup"
alias gcnv="git commit --no-verify"
## Ember
alias et="yarn test --serve -f"
## Guard
alias gg="bundle exec guard -c"
## Docker
alias dc="docker compose"
alias dbw="docker compose build web"
alias duw="docker compose up web"
alias drw="docker compose run --rm web"
alias drwbe="docker compose run --rm web bundle exec"
alias drt="docker-compose run -e RAILS_ENV=test --rm web rspec --format=documentation"
## CPU Profiling
alias record-cpu-usage="TODAY=`date '+%Y-%m-%d'` && top -l 28800 -ocpu -R -F -s 1 | grep 'CPU usage' --line-buffered | tee -a '~/CPU Usage/raw_data/$TODAY.txt'"
alias open_am="open -n -a 'Activity Monitor'"
## Personal
alias stretch="cd ~/Development/speak_routine && ruby run.rb"

## Functions

# $1 - The name of the file.
# $2 (optional) - The path to create the file at.
new_md () {
  if [ -z "$2" ]
  then # No path was given.
    new_file_path=$1.md
  else
    mkdir -p $2
    new_file_path=$2/$1.md
  fi
  echo "# $1" >> $new_file_path
}

# Plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages zsh-completions)
autoload -U compinit && compinit

source $ZSH/plugins/history-substring-search/history-substring-search.zsh
source $ZSH/z.sh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Homewbrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(lvim {})+abort'"
alias preview="fzf --preview 'bat --color \"always\" {}'"

# Pure Prompt
fpath+=$(brew --prefix)/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure

# asdf
## This export shouldn't be necessary. It's to workaround this bug: https://github.com/asdf-vm/asdf/issues/1103
export ASDF_DIR="$(brew --prefix asdf)/libexec"
. $(brew --prefix asdf)/libexec/asdf.sh

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
