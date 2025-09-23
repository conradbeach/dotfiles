source ~/development/dotfiles/omarchy/bash/config.bash
source ~/development/dotfiles/omarchy/bash/aliases.bash

for function_file in ~/development/dotfiles/omarchy/bash/functions/*.bash; do
  source "$function_file"
done