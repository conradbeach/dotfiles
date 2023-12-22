# Manual Mac Setup

## Files
- [ ] Copy '~/VirtualBox VMs' folder from Time Machine backup onto this machine.
- [ ] Copy '~/Downloads' folder from Time Machine backup onto this machine.
- [ ] Copy relevant projects onto this machine from the '~/Development' folder from Time Machine backup.

## OS Settings

### General
- [ ] Change default web browser to Firefox Developer Edition.
- [ ] Check "Ask to keep changes when closing documents".

#### Battery
- [ ] Check "Show Percentage".

#### Clock
- [ ] Check "Display the time with seconds".

### Notifications & Focus
- [ ] Check "Allow notifications: When mirroring or sharing the display"

### Internet Accounts
- [ ] Turn on Calendars for personal Google account.

### Wallet & Apple Pay
- [ ] Add Apple Card to Wallet.

### Security & Privacy

#### General
- [ ] Require password after 5 seconds of sleep or screen saver.
- [ ] Allow apps downloaded from: App Store and identified developers.

#### FileVault
- [ ] Turn on FileVault.

#### Firewall
- [ ] Turn on Firewall.

### Software Update
- [ ] Check "Automatically keep my Mac up to date".

### Bluetooth
- [ ] Connect to iPhone with Bluetooth.

### Touch ID
- [ ] Set up Touch ID.

### Keybaord

#### Keyboard

##### Modifier Keys
- [ ] Map caps lock to escape on internal and external keyboards.

#### Shortcuts

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

### Displays
- [ ] Adjust display positions to match their position on your desk.

#### Display Settings
- [ ] Set external monitor to be main display.

#### Night Shift
- [ ] Change it to run from 12:00am to 11:59pm. (All the time.)
- [ ] Set the color temperature to be a little warmer than the middle line of the scale.

### Time Machine
- [ ] Set up back up disk.
- [ ] Set it to back up automatically daily.

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
  * Install the iOS version from the Mac App Store. (There's an offical MacOS desktop version but I had issues with it.)
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
  * Load License (In iCloud Drive > Software Licenses and Such.)
  * Set up syncing (snippets too). Sync files are in iCloud Drive > Dash Sync.
  * Load custom docsets (In this repo at ./Dash/custom_dash_docsets)
* [ ] iTerm
  * Load configuration. (In this repo. Change in Settings > General > Preferences)
* [ ] Firefox Developer Edition
  * Import sessions into Tab Session Manager. The backup is in the Downloads folder.
  * Import Tab Session Manager settings as well. They're in the same folder.
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

## Security
- [ ] Generate a new GPG key. (Using GitKraken is the easiest. And it handles things like updating your Git profile so GPG signing will work outside of GitKraken.)
- [ ] Add the new GPG key to your GitHub and GitLab accounts. (Use GitKraken to copy it.)

## Login Items
Add these login items (In Settings > Users & Groups > Login Items):
* Awair Home
* Aware
* BetterTouchTool
* Dash
* Maccy
* Postgres.app
