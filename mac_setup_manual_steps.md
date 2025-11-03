# Manual Mac Setup

## Files
- [ ] Copy '~/Downloads' folder from previous machine onto this machine.
- [ ] Copy relevant projects in '~/development' from previous machine onto this machine.

## OS Settings
- [ ] Confirm MacOS settings were applied correctly by the setup script

### iCloud
- [ ] Sign into iCloud

### Network
- [ ] Enable Firewall

### General
#### Software Update
- [ ] In Automatic Updates, enable "Install macOS updates".

### Control Center
#### Control Center Modules
- [ ] Set Bluetooth to "Show in Menu Bar"
- [ ] Set Focus to "Always Show in Menu Bar"
- [ ] Set Sound to "Always Show in Menu Bar"

#### Other Modules
- [ ] Set Battery to "Show Percentage".
- [ ] Set Music Recognition to "Always Show in Control Center"

#### Menu Bar Only
- [ ] In Clock Options, enable "Display the time with seconds"
- [ ] Set Spotlight to Don't Show in Menu Bar

### Siri and Spotlight
- [ ] Enable Ask Siri

### Privacy and Security
#### Sensitive Content Warning
- [ ] Enable
- [ ] Enable for all available apps.
- [ ] Enable "Improve Sensitive Content Warning" if this is a personal machine.

### Desktop and Dock
#### Widgets
- [ ] Change default web browser to Zen.

#### Windows
- [ ] Enable "Ask to keep changes when closing documents".
- [ ] Disable "Tiled windows have margins".

#### Mission Control
- [ ] Enable "Group windows by application".

### Lock Screen
- [ ] Require password after 5 seconds of sleep or screen saver.

### Keyboard
#### Keyboard Shortcuts
##### Launchpad & Dock
- [ ] Turn off Turn Dock Hiding On/Off (option-command-d)

##### Mission Control
- [ ] Turn off Mission Control (control-up).
- [ ] Turn off Application windows (control-down).
- [ ] Turn off Move left a space (control-left).
- [ ] Turn off Move right a space (control-right).

#### Dictation
- [ ] Turn on Dictation.

### Trackpad
#### More Gestures
- [ ] Turn off Swipe between pages
- [ ] Change Swipe between full screen apps to four fingers.
- [ ] Change Mission Control to four fingers.
- [ ] Change App Expose to four fingers.

### Touch ID
- [ ] Set up Touch ID.


## Finder Settings

### General
- [ ] Change "New Finder window shows" to home folder.

### Sidebar
- [ ] Change 'Favorites' sidebar list to: home folder, development, Downloads, Applications, Air Drop.
- [ ] Change 'Locations' sidebar list to: Conrad's MacBook Pro, External disks

### Advanced
- [ ] Check "Remove items from trash after 30 days".

## Application Changes
- [ ] Xcode
  - Install this first since it's huge.
- [ ] Awair Home
  - Install the iOS version from the Mac App Store.
- [ ] BetterTouchTool
  - Load license. (In iCloud Drive > Software Licenses and Such.)
  - Load configuration. (In this repo.)
  - Install process priority helper tool.
- [ ] Bitdefender Virus Scanner
  - [Install it manually.](https://www.bitdefender.com/solutions/virus-scanner-for-mac.html)
  - Add these exceptions:
    - /Volumes/Mac Backup
    - /Volumes/.timemachine
    - /Volumes/com.apple.TimeMachine.localsnapshots
- [ ] Claude Desktop
  - Set to run on startup. (Settings > General)
  - Disable "Quick Entry Keyboard Shortcut" (Settings > General)
  - Disable "Show Claude in the menu bar" (Settings > General)
- [ ] Dash
  - Activate subscription
  - Set up syncing. (In this repo at ./Dash/Dash.dashsync)
  - Set up snippets. (In this repo at ./Dash/Snippets.dash)
  - Load custom docsets (In this repo at ./Dash/custom_dash_docsets)
- [ ] Karabiner Elements
  - Run Karabiner Elements and give it all necessary permissions.
- [ ] iTerm
  - Load configuration. (In this repo. Change in Settings > General > Settings)
- [ ] Firefox Developer Edition
  - Sign in with Firefox account.
- [ ] Messages
  - Turn on "Enable Messages in iCloud". (In Settings > iMessage.)
- [ ] Microsoft Copilot (Deseret Book machines only)
  - Install from the Mac App Store.
  - Sign in with Deseret Book Microsoft account.
- [ ] Mouseless
  - Import config file from this repo.
- [ ] Obsidian
  - Set up Obsidian Sync. Put the vault in ~/Obsidian.
- [ ] Perplexity
  - Install from Mac App Store.
  - Disable all shortcuts.
  - Sign in with email. (No password required.)
- [ ] Proton Authenticator
  - Install from Mac App Store.
  - Log in and restore from iCloud.
- [ ] TablePlus
  - Enable Alert Mode 2. Warn before sending queries to the server except SELECT type queries. Change in Preferences > Security > Default Safe Mode for new connection.
- [ ] Visual Studio Code
  - Sign in to turn on Settings Sync. Sign in with GitHub.
- [ ] Zen Browser
  - Turn on syncing.

Remove all unwanted apps from Dock.

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## AstroNvim
- [ ] Run :checkhealth.

## Claude Code
- [ ] Populate MEDIA_API_READ_ONLY_ROLLBAR_ACCESS_TOKEN.txt and IRMS_API_READ_ONLY_ROLLBAR_ACCESS_TOKEN.txt with read only Rollbar access tokens.

## GPG
- [ ] Generate a new GPG key. (Follow the GitHub docs: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
- [ ] Add the new GPG key to your GitHub account.

## SSH
- [ ] Copy your SSH key by running 'pbcopy < ~/.ssh/id_ed25519.pub' and add it to GitHub.

## Login Items
Add these login items (In Settings > Users & Groups > Login Items):
* BetterTouchTool
* Karabiner Elements
* Microsoft Outlook if this is a Deseret Book machine.
* Microsoft Teams if this is a Deseret Book machine.
* Mouseless
* Postgres.app
* Stillcolor
