# New Omarchy Machine Setup

## TODO
- [ ] Mise provides [environments](https://mise.jdx.dev/environments/) which can
replace my current use of direnv.

## Notes
- Using bash instead of zsh.
  - Not sure how much value I'm getting out of zsh as opposed to Bash. Bash is
  default in Omarchy and it will probably meet my needs just fine. Using Bash
  makes things simpler.
- Using mise instead of asdf.
  - I still really like asdf, but it seems like mise is a better but still very
  compatible version of asdf. And it's the default in Omarchy.

## Omarchy
```
ln -sfn ~/development/dotfiles/omarchy/hypr/autostart.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/bindings.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/envs.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hypridle.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hyprland.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hyprlock.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/hyprsunset.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/input.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/monitors.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/windows.conf ~/.config/hypr/
```

## Git
```
ln -sfn ~/development/dotfiles/.gitignore_global ~
ln -sfn ~/development/dotfiles/git-commit-template.txt ~
```

On a personal machine:
```
ln -sfn ~/development/dotfiles/omarchy/.gitconfig ~
```

On a Deseret Book machine:
```
ln -sfn ~/development/dotfiles/omarchy/.gitconfig_deseret_book ~/.gitconfig
```

## Mise
```
ln -sfn ~/development/dotfiles/.default-gems ~
ln -sfn ~/development/dotfiles/.default-npm-packages ~
```

## Ruby
```
ln -sfn ~/development/dotfiles/.rspec ~
```

## tmux
```
# - [ ] Install tmux somehow

ln -sfn ~/development/dotfiles/.tmux.conf ~
```

## Neovim
```
ln -sfn ~/development/dotfiles/astronvim ~/.config/nvim
nvim  --headless -c 'quitall'

ln -sfn ~/development/dotfiles/.ripgreprc ~
```

## SSH
See [GitHub's instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
for up to date information. The below commands are a summary as of 2025.
```
ssh-keygen -t ed25519 -C "<your-email>"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ln -sf ~/development/dotfiles/omarchy/ssh/config ~/.ssh/
ln -sf ~/development/dotfiles/ssh/known_hosts ~/.ssh/
```

## Packages
Install:
- `tlrc-bin` (tldr command line tool)
- `ripgrep`
- `neovim`

## Services
Install:
- Postgres
- Redis

## Applications
Install:
- Claude (desktop app or web app)
- `gitkraken`
- Linear (desktop or web app)
- Mouseless (once it's available for wayland)
- `postman-bin`
- Slack (desktop or web app)
- `tableplus`
- `visual-studio-code-bin`
- `zen-browser-bin`
- WhatsApp (web app)

### Obsidian
```
mkdir -p ~/Obsidian
ln -sfn ~/development/dotfiles/.obsidian.vimrc ~/Obsidian
```

Log into Obsidian Sync and set up vault in `~/Obsidian`
