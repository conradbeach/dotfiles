# With this set, bash sessions will append their history list to the history file, rather than replace it.
# Thus, multiple parallel bash sessions will all have the new entries from their history lists added to the history file, in the order that they exit.
shopt -s histappend

# Vi Mode
set -o vi # Change keybindings to vi.

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ripgrep
export RIPGREP_CONFIG_PATH=~/.ripgreprc
