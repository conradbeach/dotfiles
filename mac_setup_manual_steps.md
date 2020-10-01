# Manual Mac Setup

## Files
- [ ] Copy '~/VirtualBox VMs' folder from Time Machine backup onto this machine.
- [ ] Copy '~/Downloads' folder from Time Machine backup onto this machine.
- [ ] Copy relevant projects onto this machine from the '~/Development' folder from Time Machine backup.

## OS Settings
- [ ] Change 'Favorites' sidebar list to: home folder, Development, Downloads, Applications, Air Drop.
- [ ] Change 'Locations' sidebar list to: Conrad's MacBook Pro, Network
- [ ] Change "Click in the scroll bar to" to "Jump to the spot that's clicked". (In Settings > General.)
- [ ] Check "Ask to keep changes when closing documents". (In Settings > General).
- [ ] Change default web browser to Firefox Developer Edition. (In Settings > General.)
- [ ] Uncheck "Show indicators for open applications". (In Settings > Dock.)
- [ ] Uncheck "Show recent applications in Dock". (In Settings > Dock.)
- [ ] Enable Atomic Jolt Google account for Calendar. (In Settings > Internet Accounts.)
- [ ] Require password after 5 seconds of sleep or screen saver. (In Settings > Security & Privacy > General.)
- [ ] Turn on FileVault. (In Settings > Security & Privacy > FileVault.)
- [ ] Turn on Firewall. (In Settings > Security & Privacy > Firewall.)
- [ ] Uncheck "Show Input menu in menu bar". (In Settings > Keyboard > Input Sources.)
- [ ] Change Spotlight keybinding to option-space. (In Settings > Keyboard Shortcuts > Spotlight.)
- [ ] Map caps lock to escape on internal and external keyboards.
- [ ] Change Swipe between full screen apps to four fingers.
- [ ] Change Mission Control to four fingers.
- [ ] Change App Expose to four fingers.
- [ ] Change minimize windows to scale effect. (In Settings > Dock > Minimize windows using)
- [ ] Show Bluetooth in menu bar. (In Settings > Bluetooth)
- [ ] Connect to iPhone with Bluetooth.
- [ ] Display folder on top in Finder. (In Finder Preferences > Advanced)
- [ ] Display the time with seconds. (In Settings > Date & Time > Clock.)
- [ ] Set up Time Machine.
- [ ] Check "Show Time Machine in menu bar". (In Settings > Time Machine.)

TODO: It'd be great to automate most of the above in the Mac setup script where possible.
This article tells how to determine changes being made: https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/#the-way-to-find-the-domain--key-responsible-for-a-setting

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## Neovim
- [ ] Run :checkhealth.
- [ ] Run :PlugInstall.

## Security
- [ ] Generate a new GPG key. (Using GitKraken is the easiest.)
- [ ] Add the new GPG key to your GitHub and GitLab accounts. (Use GitKraken to copy it.)
- [ ] Update your Atomic Jolt wiki page with your new SSH and GPG keys.

## Application Changes
* [ ] Xcode
  * Install this first since it's huge.
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
* [ ] Messages
  * Turn on "Enable Messages in iCloud". (In Settings > iMessage.)
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

## Login Items
Add these login items (In Settings > Users & Groups > Login Items):
* Aware
* CopyClip2
* Dash
* Dropbox
* Lacona
* Vimac
