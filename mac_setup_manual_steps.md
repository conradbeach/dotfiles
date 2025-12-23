# Manual Mac Setup

## Files
- [ ] Copy '~/Downloads' folder from previous machine onto this machine.
- [ ] Copy relevant projects in '~/development' from previous machine onto this machine.

## OS Settings
- [ ] Confirm MacOS settings were applied correctly by the setup script

### Network
- [ ] Enable Firewall

### General
### Menu Bar
- [ ] Set "Automatically hide and show the menu bar" to "Always"

#### Menu Bar Controls
- [ ] In Clock Options, enable "Display the time with seconds"
- [ ] Disable Spotlight control.
- [ ] Enable Bluetooth control.
- [ ] Set Battery to "Show Percentage".
- [ ] Set Focus to "Always Show"
- [ ] Set Sound to "Always Show"

### Apple Intelligence and Siri
- [ ] Enable Siri

### Desktop and Dock
#### Dock
- [ ] Enable "Automatically hide and show the Dock".

#### Widgets
- [ ] Change default web browser to Zen.

#### Windows
- [ ] Enable "Ask to keep changes when closing documents".

#### Mission Control
- [ ] Enable "Group windows by application".

### Lock Screen
- [ ] Require password after 5 seconds of sleep or screen saver.

### Privacy and Security
#### Sensitive Content Warning
- [ ] Enable
- [ ] Enable for all available apps.
- [ ] Enable "Improve Sensitive Content Warning" if this is a personal machine.

### Trackpad
#### More Gestures
- [ ] Turn off Swipe between pages
- [ ] Change Swipe between full screen apps to four fingers.
- [ ] Change Mission Control to four fingers.
- [ ] Change App Expose to four fingers.


## Finder Settings

### General
- [ ] Change "New Finder window shows" to home folder.

### Sidebar
- [ ] Change 'Favorites' sidebar list to: home folder, development, Downloads, Applications, Air Drop.
- [ ] Change 'Locations' sidebar list to: iCloud Drive, Conrad's MacBook Pro, External disks

### Advanced
- [ ] Check "Remove items from trash after 30 days".

## Application Changes
- [ ] Awair Home
  - Install the iOS version from the Mac App Store.
- [ ] BetterTouchTool
  - Load license. (In iCloud Drive > Software Licenses and Such.)
  - Load configuration. (In this repo.)
  - Install process priority helper tool.
- [ ] Chrome
  - Install Claude for Chrome extension and sign in.
- [ ] Claude Desktop
  - Set to run on startup. (Settings > General)
  - Disable "Quick access shortcut" (Settings > General)
  - Disable "Show Claude in the menu bar" (Settings > General)
- [ ] Dash
  - Activate subscription
- [ ] Karabiner Elements
  - Run Karabiner Elements and give it all necessary permissions.
- [ ] iTerm
  - Load configuration. (In this repo. Change in Settings > General > Settings)
- [ ] Monologue
  - [Install](https://www.monologue.to/download)
  - Copy Instructions and Dictionary from another machine.
  - Settings
    - General
      - Enable recommended "Paste last transcript" shortcut.
    - Mic & Audio
      - Set microphone to use default source.
    - System
      - Disable "Show dock icon".
      - Disable "Show monophone".
    - Data & privacy
      - Enable "Deep context".
- [ ] Mouseless
  - Import config file from this repo.
- [ ] Obsidian
  - Set up Obsidian Sync. Put the vault in ~/Conrad and name it "Obsidian".
- [ ] Postgres.app
  - Initialize a Postgres server with the latest version.
- [ ] Proton Authenticator
  - Install from Mac App Store.
  - Enable iCloud sync.
- [ ] TablePlus
  - Enable Alert Mode 2. Warn before sending queries to the server except SELECT type queries. Change in Preferences > Security > Default Safe Mode for new connection.
- [ ] Zen Browser
  - Turn on syncing.

Remove all unwanted apps from Dock.

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## AstroNvim
- [ ] Run :checkhealth.

## Claude Code
- [ ] Populate MEDIA_API_READ_ONLY_ROLLBAR_ACCESS_TOKEN.txt and IRMS_API_READ_ONLY_ROLLBAR_ACCESS_TOKEN.txt with read only Rollbar access tokens.
- [ ] Run `/terminal-setup` in Claude Code.

### Plugin Marketplaces
```
# Run this in Claude Code:
/plugin marketplace add anthropics/claude-code
/plugin install frontend-design
/plugin install security-guidance

/plugin marketplace add thedotmack/claude-mem
/plugin install claude-mem

/plugin marketplace add ast-grep/claude-skill
/plugin install ast-grep
```

## GPG
- [ ] Generate a new GPG key. (Follow the GitHub docs: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
- [ ] Add the new GPG key to your GitHub account.

## SSH
- [ ] Copy your SSH key by running 'pbcopy < ~/.ssh/id_ed25519.pub' and add it to GitHub.

## Login Items
Add these login items (In Settings > Login Items & Extensions):
* BetterTouchTool
* Chrome (for Claude in Chrome)
* Claude
* Microsoft Outlook if this is a Deseret Book machine.
* Microsoft Teams if this is a Deseret Book machine.
* Monologue
* Mouseless
