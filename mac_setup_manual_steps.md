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
- [ ] Change default web browser to Arc.

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
- [ ] Amazon Q
  - Sign in with AWS Builder account.
  - Disable everything except CLI completions.
- [ ] Authy
  - Install the iPad version from Mac App Store.
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
- [ ] Cherry Studio
  - Install from [the website](https://cherry-ai.com/).
  - Enable the Anthropic provider.
  - Use the Anthropic console to generate an API key.
  - Set Claude Sonnet as the default model.
  - Set Claude Haiku as the topic naming model.
  - Create a Rails Developer assistant.
    - The prompt: "I want you to act as an expert Ruby on Rails web application developer. Primarily, you'll be doing back-end web application development and occasionally a little front-end. I will ask questions about application development and related developer workflows. Your job is to provide succinct and actionable suggestions. When it's relevant, we're using MacOS for development."
- [ ] Dash
  - Activate subscription
  - Set up syncing. (In this repo at ./Dash/Dash.dashsync)
  - Set up snippets. (In this repo at ./Dash/Snippets.dash)
  - Load custom docsets (In this repo at ./Dash/custom_dash_docsets)
- [ ] iTerm
  - Load configuration. (In this repo. Change in Settings > General > Settings)
- [ ] Firefox Developer Edition
  - Sign in with Firefox account.
- [ ] Messages
  - Turn on "Enable Messages in iCloud". (In Settings > iMessage.)
- [ ] Obsidian
  - Set up Obsidian Sync. Put the vault in ~/Obsidian.
- [ ] Perplexity
  - Install from Mac App Store.
  - Disable all shortcuts.
  - Sign in with email. (No password required.)
- [ ] TablePlus
  - Enable Alert Mode 2. Warn before sending queries to the server except SELECT type queries. Change in Preferences > Security > Default Safe Mode for new connection.
- [ ] Visual Studio Code
  - Sign in to turn on Settings Sync. Sign in with GitHub.

Remove all unwanted apps from Dock.

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## AstroNvim
- [ ] Run :checkhealth.
- [ ] Create and populate ~/.anthropic_api_key.

## GPG
- [ ] Generate a new GPG key. (Follow the GitHub docs: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
- [ ] Add the new GPG key to your GitHub account.

## SSH
- [ ] Copy your SSH key by running 'pbcopy < ~/.ssh/id_ed25519.pub' and add it to GitHub.

## Login Items
Add these login items (In Settings > Users & Groups > Login Items):
* Activity Monitor
* BetterTouchTool
* Dash
* Microsoft Outlook if this is a Deseret Book machine.
* Microsoft Teams if this is a Deseret Book machine.
* Postgres.app
* WhatsApp if this is a personal machine.
