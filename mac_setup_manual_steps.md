# Manual Mac Setup

## Files
- [ ] Copy '~/VirtualBox VMs' folder from Time Machine backup onto this machine.
- [ ] Copy '~/Downloads' folder from Time Machine backup onto this machine.

## OS Settings
- [ ] Turn on FileVault.
- [ ] Change 'Favorites' sidebar list to: home folder, Development, Downloads, Applications, Air Drop.
- [ ] Change 'Locations' sidebar list to: Conrad's MacBook Pro, Network
- [ ] Change default web browser to Firefox Developer Edition. (In Settings > General.)
- [ ] Change Spotlight keybinding to option-space. (In Settings > Keyboard Shortcuts > Spotlight.)
- [ ] Enable Atomic Jolt Google account for Calendar. (In Settings > Internet Accounts.)
- [ ] Map caps lock to escape on internal and external keyboards.
- [ ] Change Swipe between full screen apps to four fingers.
- [ ] Change Mission Control to four fingers.
- [ ] Change App Expose to four fingers.
- [ ] Change minimize windows to scale effect. (In Settings > Dock > Minimize windows using)
- [ ] Show Bluetooth in menu bar. (In Settings > Bluetooth)
- [ ] Display folder on top in Finder. (In Finder Preferences > Advanced)

Next time you do this. Make a note here in this file of everything that you change.
This article tells how to determine changes being made: https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/#the-way-to-find-the-domain--key-responsible-for-a-setting
Add setting changes to the Mac setup script where possible.

## Neovim
- [ ] Run :checkhealth.
- [ ] Run :PlugInstall.

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## Security
- [ ] Generate a new GPG key. (Using GitKraken is the easiest.)
- [ ] Add the new GPG key to your GitHub and GitLab accounts. (Use GitKraken to copy it.)
- [ ] Update your Atomic Jolt wiki page with your new SSH and GPG keys.

## Application Changes
* [ ] Aware
  * Add it to Login Items so it loads on startup.
* [ ] BetterTouchTool
  * Load license. (In iCloud Drive > Software Licenses and Such.)
  * Load configuration. (In this repo.)
* [ ] CopyClip2
  * Change keyboard shortcut to Ctrl-Space
  * Load license. (In iCloud Drive > Software Licenses and Such.)
  * Update other settings.
* [ ] Dash
  * Load License (In iCloud Drive > Software Licenses and Such.)
  * Set up syncing. Sync files are in iCloud Drive > Dash Sync.
* [ ] Dropbox
  * Sign in with your Atomic Jolt account.
* [ ] iTerm
  * Load configuration. (In this repo. Change in Settings > General > Preferences)
  * Change text to Hack Nerd Font regular 16 point. (Settings > Profiles > Text)
* [ ] Firefox Developer Edition
  * Import sessions into Tab Session Manager. The backup is in the Downloads folder.
* [ ] Lacona
  * Install it from the Mac App Store.
  * Change keybinding to command-space.
  * Install addons: Caffeniate, Convert Currency, Time Zones, Timers & Alarms.
* [ ] Screenshot App
  * Change save location to Downloads folder.
* [ ] Sophos Home
  * Log into you dashboard to install it.
* [ ] Terminal.app
  * Load theme. (Dracula.theme in this repo.)
  * In Settings > General, set custom theme to be the default.
  * In Settings > General, change 'Shells open with:' to '/bin/zsh'.
* [ ] Vimac
  * Install it. (https://github.com/dexterleng/vimac/)
  * Set to launch at login.
  * Change Hint Mode shortcut to ctl-f, set custom characters to 'asdfghjkl', set text size to 12.
  * Change Scroll Mode shortcut to ctl-shift-s.
