# Manual Mac Setup

## Files
- [ ] Copy '~/Downloads' folder from Time Machine backup onto this machine.
- [ ] Copy relevant projects onto this machine from the '~/Development' folder from Time Machine backup.

## OS Settings

- [ ] Confirm MacOS settings were applied correctly by the setup script

### Network
- [ ] Enable Firewall

### General
#### Software Update
- [ ] In Automatic Updates, enable "Install macOS updates".

#### Time Machine
- [ ] Set up back up disk.
- [ ] Set it to back up automatically daily.

### Control Center
#### Control Center Modules
- [ ] Set Bluetooth to "Show in Menu Bar"
- [ ] Set Focus to "Always Show in Menu Bar"
- [ ] Set Sound to "Always Show in Menu Bar"

#### Other Modules
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
- [ ] Enable "Improve Sensitive Content Warning"

### Desktop and Dock
#### Widgets
- [ ] Change default web browser to Firefox Developer Edition.

#### Windows
- [ ] Enable "Ask to keep changes when closing documents".

#### Mission Control
- [ ] Enable "Group windows by application".

### Displays
- [ ] Adjust display positions to match their position on your desk.

#### Night Shift
- [ ] Change it to run from 12:00am to 11:59pm. (All the time.)
- [ ] Set the color temperature to be a little warmer than the middle line of the scale.

#### Display Settings
- [ ] Set external monitor to be main display.

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

##### Modifier Keys
- [ ] Map caps lock to escape on internal and external keyboards.

#### Dictation
- [ ] Turn on Dictation.

### Trackpad
#### More Gestures
- [ ] Turn off Swipe between pages
- [ ] Change Swipe between full screen apps to four fingers.
- [ ] Change Mission Control to four fingers.
- [ ] Change App Expose to four fingers.

### Battery
- [ ] Check "Show Percentage".

### Touch ID
- [ ] Set up Touch ID.


## Finder Settings

### General
- [ ] Change "New Finder window shows" to home folder.

### Sidebar
- [ ] Change 'Favorites' sidebar list to: home folder, Development, Downloads, Applications, Air Drop.
- [ ] Change 'Locations' sidebar list to: Conrad's MacBook Pro, External disks

### Advanced
- [ ] Check "Remove items from trash after 30 days".

## Application Changes
* [ ] Xcode
  * Install this first since it's huge.
* [ ] Authy
  * Install manually.
* [ ] Awair Home
  * Install the iOS version from the Mac App Store.
* [ ] BetterTouchTool
  * Load license. (In iCloud Drive > Software Licenses and Such.)
  * Load configuration. (In this repo.)
* [ ] Bitdefender Virus Scanner
  * [Install it manually.](https://www.bitdefender.com/solutions/virus-scanner-for-mac.html)
  * Add these exceptions:
    * /Volumes/Mac Backup
    * /Volumes/.timemachine
    * /Volumes/com.apple.TimeMachine.localsnapshots
* [ ] Dash
  * Activate subscription
  * Set up syncing. Sync files are in iCloud Drive > Dash Sync > General Sync.
  * Set up snippets. Sync files are in iCloud Drive > Dash Sync > Snippets.
  * Load custom docsets (In this repo at ./Dash/custom_dash_docsets)
* [ ] iTerm
  * Load configuration. (In this repo. Change in Settings > General > Preferences)
* [ ] Firefox Developer Edition
  * Sign in with Firefox account.
* [ ] Maccy
  * Change keyboard shortcut to Option-Space
  * Turn on "Launch at login".
  * Turn on "Check for updates automatically"
  * Change "Search" to "Fuzzy"
  * Change "Popup at" to "Screen center".
  * Change "Number of items" to 15.
  * Add Bitwarden to Ignore > Applications.
  * Don't allow notifications.
* [ ] Messages
  * Turn on "Enable Messages in iCloud". (In Settings > iMessage.)
* [ ] TablePlus
  * Enable Alert Mode 2. Warn before sending queries to the server except SELECT type queries. Change in Preferences > Security > Default Safe Mode for new connection.
* [ ] Terminal.app
  * Load theme. (Dracula.theme in this repo.) Change in Preferences > Profiles > ... button > Import...
  * In Settings > General, set Dracula theme to be the default.
  * In Settings > General, change 'Shells open with:' to '/bin/zsh'.
* [ ] Visual Studio Code
  * Sign in to turn on Settings Sync. Sign in with GitHub.

Remove all unwanted apps from Dock.

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## AstroNvim
- [ ] Run :checkhealth.

## GPG
- [ ] Generate a new GPG key. (Follow the GitHub docs: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
- [ ] Add the new GPG key to your GitHub account.

## SSH
- [ ] Copy your SSH key by running 'pbcopy < ~/.ssh/id_ed25519.pub' and add it to GitHub.

## Login Items
Add these login items (In Settings > Users & Groups > Login Items):
* Awair Home
* Aware
* BetterTouchTool
* Dash
* Maccy
* Postgres.app
