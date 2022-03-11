# Manual Mac Setup

## Files
- [ ] Copy '~/VirtualBox VMs' folder from Time Machine backup onto this machine.
- [ ] Copy '~/Downloads' folder from Time Machine backup onto this machine.
- [ ] Copy relevant projects onto this machine from the '~/Development' folder from Time Machine backup.

## OS Settings

### General
- [ ] Change "Appearance" to "Dark".
- [ ] Change "Show scroll bars" to "Always".
- [ ] Change "Click in the scroll bar to" to "Jump to the spot that's clicked".
- [ ] Change default web browser to Firefox Developer Edition.
- [ ] Check "Ask to keep changes when closing documents".

### Dock & Menu Bar
- [ ] Change minimize windows to scale effect.
- [ ] Uncheck "Show indicators for open applications".
- [ ] Uncheck "Show recent applications in Dock".

#### Bluetooth
- [ ] Check "Show in Menu Bar".

#### Focus
- [ ] Change "Show in Menu Bar" to "always".

#### Sound
- [ ] Change "Show in Menu Bar" to "always".

#### Battery
- [ ] Check "Show Percentage".

#### Fast User Switching
- [ ] Check "Show in Control Center".

#### Clock
- [ ] Check "Display the time with seconds".

#### Spotlight
- [ ] Uncheck "Show in Menu Bar".

#### Siri
- [ ] Uncheck "Show in Menu Bar".

#### Time Machine
- [ ] Check "Show Time Machine in menu bar".

### Mission Control
- [ ] Uncheck "Automatically rearrange Spaces based on most recent use".
- [ ] Check "Group windows by application"

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

##### Spotlight
- [ ] Change shortcut to ctrl-space.

#### Input Sources
- [ ] Uncheck "Show Input menu in menu bar".

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
- [ ] Scale external monitor to look like 1440p. (Assuming you're still using a
  27ish inch 4k display.)

#### Night Shift
- [ ] Change it to run from 12:00am to 11:59pm. (All the time.)
- [ ] Set the color temperature to be a little warmer than the middle line of the scale.

### Time Machine
- [ ] Set up back up disk.
- [ ] Set it to back up automatically.
- [ ] Check Show Time Machine in menu bar.

## Finder Settings

### General
- [ ] Change "New Finder window shows" to home folder.

### Sidebar
- [ ] Change 'Favorites' sidebar list to: home folder, Development, Downloads, Applications, Air Drop.
- [ ] Change 'Locations' sidebar list to: Conrad's MacBook Pro, External disks

### Advanced
- [ ] Check "Show all filename extensions".
- [ ] Uncheck "Show warning before changing an extension".
- [ ] Uncheck "Show warning before removing from iCloud Drive".
- [ ] Uncheck "Show warning before emptying the Trash".
- [ ] Check "Remove items from trash after 30 days".
- [ ] Check "Keep folders on top: In windows when sorting by name".

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## Neovim
- [ ] Run :PlugInstall.
- [ ] Run :checkhealth.
- [ ] Install the following coc.nvim extensions (command is `:CocInstall [extenson]`:
  - coc-css
  - coc-html
  - coc-json
  - coc-solargraph
  - coc-tsserver
  - coc-tabnine
  - TODO: The [coc.nvim README](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#automation-script) has an automatic script you could set up.

## Security
- [ ] Generate a new GPG key. (Using GitKraken is the easiest. And it handles things like updating your Git profile so GPG signing will work outside of GitKraken.)
- [ ] Add the new GPG key to your GitHub and GitLab accounts. (Use GitKraken to copy it.)

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
* [ ] Chrome
  * Install the [Markdown Viewer](https://github.com/simov/markdown-viewer) extension.
  * Follow [After Install](https://github.com/simov/markdown-viewer#after-install) steps.
* [ ] Dash
  * Load License (In iCloud Drive > Software Licenses and Such.)
  * Set up syncing (snippets too). Sync files are in iCloud Drive > Dash Sync.
* [ ] iTerm
  * Load configuration. (In this repo. Change in Settings > General > Preferences)
* [ ] Firefox Developer Edition
  * Import sessions into Tab Session Manager. The backup is in the Downloads folder.
  * Import Tab Session Manager settings as well. They're in the same folder.
* [ ] J&J 7 Minute Workout
  * Install the iOS version from the Mac App Store.
* [ ] Jabra Direct
  * [Install it manually.](https://www.jabra.com/software-and-services/jabra-direct)
* [ ] Kap
  * Turn on "Highlight clicks"
  * Turn off "Loop exports"
  * Turn on "Start automatically"
  * Turn on "Lossy GIF compression"
  * Change "Save to..." to "~/Downloads".
* [ ] Maccy
  * Change keyboard shortcut to Option-Space
  * Turn on "Launch at login".
  * Turn on "Check for updates automatically"
  * Change "Popup at" to "Cursor".
  * Change "Menu size" to 15.
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

## Login Items
Add these login items (In Settings > Users & Groups > Login Items):
* Awair Home
* Aware
* BetterTouchTool
* Dash
* Jabra Direct
* krisp
* Maccy
* Postgres.app