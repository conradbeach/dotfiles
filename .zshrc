export ZSH=~/.oh-my-zsh # Path to your oh-my-zsh installation.

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export SHELL="/usr/local/bin/zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell-altered-by-conrad"
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
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

## Aliases
# General
alias cp="cp -iv"
alias rm="rm -iv"
alias mv="mv -iv"
alias sed="sed -E"
alias help="tldr"
alias n="nvim"
alias k9="kill -9"
alias notes="cd ~/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents && nvim"
alias cl="clear"
alias src="source ~/.zshrc"
alias vg="vagrant"
alias restart_nginx="echo \"stopping nginx\" && sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.nginx.plist && echo \"starting nginx\" && sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist && echo \"nginx restarted\""
alias bs="brew services"
# Overrides (Remember that you can run the original command by prepending it with a \. e.g. `\cat` will run the real cat instead of bat.)
alias ls="colorls --group-directories-first --git-status --almost-all -1"
alias cat="bat"
alias top="htop"
alias find="fd -H"
# Ruby & Rails
alias cra="bundle exec rspec && rubocop && bundle audit check --update && brakeman && rubycritic app" # Short for 'check rails app'
alias be="bundle exec"
alias hr="heroku run"
alias ss="bundle exec spring stop"
alias rs="bundle exec spring stop && bundle exec rails server"
alias rc="bundle exec rails console"
alias sss="bundle exec spring stop; rake tmp:clear"
alias fix_pg="trash /usr/local/var/postgres/postmaster.pid; brew services restart postgresql; brew services list"
# Git
alias grm="git rebase master -i --autosquash"
alias gri="git rebase -i --autosquash"
alias grc="git rebase --continue"
alias gcf="git commit --fixup"
alias gcnv="git commit --no-verify"
# Guard
alias gg="bundle exec guard -c"
# CPU Profiling
alias record-cpu-usage="TODAY=`date '+%Y-%m-%d'` && top -l 28800 -ocpu -R -F -s 1 | grep 'CPU usage' --line-buffered | tee -a '~/CPU Usage/raw_data/$TODAY.txt'"
alias open_am="open -n -a 'Activity Monitor'"
# Atomic Jolt
alias aalint="bundle exec pronto run -r eslint_npm rubocop"

## Functions

# $1 - The name of the new directory.
mkcd () {
  mkdir "$1"
  cd "$1"
}

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

## Plugins

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages)

source $ZSH/plugins/history-substring-search/history-substring-search.zsh
source $ZSH/z.sh
source $ZSH/zsh-git-prompt/zshrc.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(nvim {})+abort'"
alias preview="fzf --preview 'bat --color \"always\" {}'"

# tmuxinator
source ~/.tmuxinator.zsh

# Pure Prompt
autoload -U promptinit; promptinit
prompt pure

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

## asdf-java
. $HOME/.asdf/plugins/java/set-java-home.sh

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

## Functions/Scripts
function mcd() {
  mkdir -p "$1" && cd "$1";
}
