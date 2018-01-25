local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# ~/.oh-my-zsh/git-prompt.sh prompt
# PROMPT='${ret_status} %{$fg[red]%}[$(rbenv_prompt_info)]%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%}%{$fg[yellow]%}$(__git_ps1 " (%s)")%{$reset_color%} %{$fg[cyan]%}$ '
# ~/.oh-my-zsh/zsh-git-prompt.sh
# See that file for variables.
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} %{$fg[cyan]%} ∫ '

## For ~/.oh-my-zsh/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE="true" # Unstaged (*) and staged (+) changes
GIT_PS1_SHOWSTASHSTATE="true" # '$' shows something is stashed
GIT_PS1_SHOWUNTRACKEDFILES="" # I don't usually care about untracked files.
GIT_PS1_SHOWUPSTREAM="auto" # When value is "auto", "<" you are behind, ">" you are ahead, "<>" you have diverged, "=" there is no difference.
                            # Change value to "verbose" to show number of commits ahead/behind (+/-) upstream
GIT_PS1_STATESEPARATOR=" " # The separator between the branch name and the above state symbols
#     contains      relative to newer annotated tag (v1.6.3.2~35)
#     branch        relative to newer tag or branch (master~4)
#     describe      relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
#     default       exactly matching tag
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWCOLORHINTS="" # a colored hint about the current dirty state

# Possible color values
# black # Too dark for black terminal.
# red
# green
# yellow
# blue # Too dark for black terminal.
# magenta
# cyan
# white
