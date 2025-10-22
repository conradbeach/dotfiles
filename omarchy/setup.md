# New Omarchy Machine Setup

## TODO
- [ ] Mise provides [environments](https://mise.jdx.dev/environments/) which can
replace my current use of direnv.
- [ ] Starship config
  - Second line for prompt.
  - Show run time for long running commands.

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
ln -sfn ~/development/dotfiles/omarchy/hypr/looknfeel.conf ~/.config/hypr/
ln -sfn ~/development/dotfiles/omarchy/hypr/monitors.conf ~/.config/hypr/
```

## Neovim
```
rm -rf ~/.config/nvim
ln -sfn ~/development/dotfiles/astronvim ~/.config/nvim
nvim  --headless -c 'quitall'

ln -sfn ~/development/dotfiles/.ripgreprc ~

# Run :checkhealth inside Neovim.
```

## Bash
Add contents of `./omarchy/bash/.bashrc_addendum` to bottom of `~/.bashrc`.

## Mise
```
ln -sfn ~/development/dotfiles/.default-gems ~
ln -sfn ~/development/dotfiles/.default-npm-packages ~
```

## Packages
Install:
- `tmux`

## Services
Install:
- Postgres
- Redis

## Languages
Install:
- NodeJS
- Python
- Ruby

## Applications
Install:
- Claude (desktop app or web app)
- `gitkraken`
- Linear (desktop or web app)
- Mouseless (once it's available for wayland)
- `postman-bin`
- Slack (desktop or web app)
- `tableplus`
  - Enable Alert Mode 2. Warn before sending queries to the server except SELECT type queries. Change in Preferences > Security > Default Safe Mode for new connection.
- `visual-studio-code-bin` (Omarchy might come with this out of the box.)
- `zen-browser-bin`
  - Turn on syncing.
- WhatsApp (web app)

### Obsidian
```
mkdir -p ~/Obsidian
ln -sfn ~/development/dotfiles/.obsidian.vimrc ~/Obsidian
```

Log into Obsidian Sync and set up vault in `~/Obsidian`

## Claude Code
```
mkdir -p ~/.claude
ln -sfn ~/development/dotfiles/claude/GLOBAL.md ~/.claude/CLAUDE.md
ln -sfn ~/development/dotfiles/claude/agents ~/.claude
ln -sfn ~/development/dotfiles/claude/commands ~/.claude
ln -sfn ~/development/dotfiles/claude/settings.json ~/.claude/settings.json
```

### Context7 (https://github.com/upstash/context7)
```
claude mcp add Context7 --scope user -- npx -y @upstash/context7-mcp
```

### Serena MCP
```
claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server --context ide-assistant
```

### Plugin Marketplaces

**Run this in Claude Code:**
```
/plugin marketplace add anthropics/claude-code

/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
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

## Ruby
```
ln -sfn ~/development/dotfiles/.rspec ~
```

## tmux
```
ln -sfn ~/development/dotfiles/.tmux.conf ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Hit `<prefix>+I` in tmux to install plugins.
```

## SSH
See [GitHub's instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
for up to date information. The below commands are a summary as of 2025.
```
# Check if there's already an SSH key created by Omarchy.

ssh-keygen -t ed25519 -C "<your-email>"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ln -sfn ~/development/dotfiles/omarchy/ssh/config ~/.ssh/
ln -sfn ~/development/dotfiles/ssh/known_hosts ~/.ssh/
```

Copy your SSH key by running `cat ~/.ssh/id_ed25519.pub` and add it to GitHub.

## GPG
- Generate a new GPG key. (Follow the GitHub docs: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
  - Add summary like SSH section has.
- Add the new GPG key to your GitHub account.
- Configure GitKraken to use the key. (This will also add it to your global git config.)
