export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH" # For uv
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="/Users/$USER/.cargo/bin:$PATH"

export SHELL="/bin/zsh"

# With this set, zsh sessions will append their history list to the history file, rather than replace it.
# Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file, in the order that they exit.
setopt appendhistory

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

# Increase file descriptor ulimit. This prevents an AstroNvim issue I was running into.
# https://github.com/AstroNvim/AstroNvim/issues/1896
ulimit -n 1024

# mise
eval "$(mise activate zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(lvim {})+abort'"

# Homewbrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pure Prompt
fpath+=$(brew --prefix)/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure

# ripgrep
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# Rollbar
## This token powers the Rollbar MCP server for Claude Code.
export ROLLBAR_ACCESS_TOKEN=$(cat ~/MEDIA_API_READ_ONLY_ROLLBAR_ACCESS_TOKEN.txt 2>/dev/null)
# export ROLLBAR_ACCESS_TOKEN=$(cat ~/IRMS_API_READ_ONLY_ROLLBAR_ACCESS_TOKEN.txt 2>/dev/null)

# Zsh Syntax Highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
# Needs to be sourced last.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
