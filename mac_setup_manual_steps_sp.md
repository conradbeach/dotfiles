# Manual Mac Setup

## OS Settings

### General
- [ ] Change "Show scroll bars" to "Always".
- [ ] Change "Click in the scroll bar to" to "Jump to the spot that's clicked".
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

#### Clock
- [ ] Check "Display the time with seconds".

#### Spotlight
- [ ] Uncheck "Show in Menu Bar".

#### Siri
- [ ] Uncheck "Show in Menu Bar".

### Mission Control
- [ ] Uncheck "Automatically rearrange Spaces based on most recent use".
- [ ] Check "Group windows by application"

### Internet Accounts
- [ ] Turn on Calendars for work Google account.

### Keybaord

#### Keyboard

##### Modifier Keys
- [ ] Map caps lock to escape on internal and external keyboards.

#### Shortcuts

##### Launchpad & Dock
- [ ] Turn off Turn Dock Hiding On/Off (option-command-d)

##### Mission Control
- [ ] Turn off Mission Control (control-up).
- [ ] Turn off Move left a space (control-left).
- [ ] Turn off Move right a space (control-right).
- [ ] Turn off Application windows (control-down).

#### Input Sources
- [ ] Uncheck "Show Input menu in menu bar".

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
- [ ] Set the color temperature to be a little warmer than the middle line of
  the scale.

## Finder Settings

### General
- [ ] Change "New Finder window shows" to home folder.

### Sidebar
- [ ] Change 'Favorites' sidebar list to: home folder, Development, Downloads, Applications
- [ ] Change 'Locations' sidebar list to: Conrad's MacBook Pro, External disks

### Advanced
- [ ] Check "Show all filename extensions".
- [ ] Uncheck "Show warning before changing an extension".
- [ ] Uncheck "Show warning before removing from iCloud Drive".
- [ ] Uncheck "Show warning before emptying the Trash".
- [ ] Check "Keep folders on top: In windows when sorting by name".
- [ ] Check "Remove items from trash after 30 days".

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
* [ ] Alfred
  * Set main Alfred hotkey to CMD-space.
  * Set up config syncing (in this repo).
* [ ] CopyClip2
  * Load license. (In iCloud Drive > Software Licenses and Such.)
* [ ] Dash
  * Load License (In iCloud Drive > Software Licenses and Such.)
  * Set up syncing. Sync files are in Google Drive (My Drive root).
* [ ] iTerm
  * Load configuration. (In this repo. Change in Settings > General > Preferences)
* [ ] Jabra Direct
  * [Install it manually.](https://www.jabra.com/software-and-services/jabra-direct)
* [ ] TablePlus
  * Enable Alert Mode 2. Warn before sending queries to the server except SELECT type queries.
* [ ] Terminal.app
  * Load theme. (Dracula.theme in this repo.)
  * In Settings > General, set custom theme to be the default.
  * In Settings > General, change 'Shells open with:' to '/bin/zsh'.
* [ ] Zoom
  * Enable "Always show meeting controls". (Settings > General)
  * Enable "Mute my mic when joining a meeting". (Settings > Audio)
  * Enable mute/unmute keyboard shortcut globally. (Settings > Keyboard Shortcuts)

## Startup Items
Set these applications to launch on login. (You have to do it through each application individually since you can't access the users and accounts preference pane.)

* BetterTouchTool
* CopyClip2
* Dash
* Jabra Direct