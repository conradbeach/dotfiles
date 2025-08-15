ln -sfn ~/development/dotfiles/omarchy/hypr/monitors.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/input.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/alacritty.toml ~/.config/alacritty/
ln -sf ~/development/dotfiles/.gitconfig ~

yay -Sy --noconfirm --needed \
  gitkraken \
  zen-browser-bin

# SSH
ssh-keygen -t ed25519 -C "conradbeach@hey.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ln -sf ~/development/dotfiles/omarchy/ssh/config ~/.ssh/
ln -sf ~/development/dotfiles/ssh/known_hosts ~/.ssh/
