source ~/development/dotfiles/zsh/config.zsh
source ~/development/dotfiles/zsh/aliases.zsh

for function_file in ~/development/dotfiles/zsh/functions/*.zsh; do
  source "$function_file"
done
