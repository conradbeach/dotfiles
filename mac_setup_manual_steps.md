# Manual Mac Setup

## Files
- [ ] Copy '~/VirtualBox VMs' folder from Time Machine backup onto this machine.
- [ ] Copy '~/Downloads' folder from Time Machine backup onto this machine.
- [ ] Copy relevant projects onto this machine from the '~/Development' folder from Time Machine backup.

## OS Settings
- [ ] Change "Click in the scroll bar to" to "Jump to the spot that's clicked". (In Settings > General.)
- [ ] Check "Ask to keep changes when closing documents". (In Settings > General).
- [ ] Change default web browser to Firefox Developer Edition. (In Settings > General.)
- [ ] Uncheck "Show indicators for open applications". (In Settings > Dock.)
- [ ] Uncheck "Show recent applications in Dock". (In Settings > Dock.)
- [ ] Enable Atomic Jolt Google account for Calendar. (In Settings > Internet Accounts.)
- [ ] Require password after 5 seconds of sleep or screen saver. (In Settings > Security & Privacy > General.)
- [ ] Turn on FileVault. (In Settings > Security & Privacy > FileVault.)
- [ ] Turn on Firewall. (In Settings > Security & Privacy > Firewall.)
- [ ] Change "Press Fn key to" to "Expand Control Strip". (In Settings > Keyboard > Keyboard)
- [ ] Uncheck "Show Input menu in menu bar". (In Settings > Keyboard > Input Sources.)
- [ ] Change Spotlight keybinding to option-space. (In Settings > Keyboard > Shortcuts > Spotlight.)
- [ ] Turn off Mission Control keyboard shortcut (control-up). (In Settings > Keyboard > Shortcuts > Mission Control.)
- [ ] Turn off Application windows keyboard shortcut (control-down). (In Settings > Keyboard > Shortcuts > Mission Control.)
- [ ] Turn off Move left a space (control-left). (In Settings > Keyboard > Shortcuts > Mission Control.)
- [ ] Turn off Move right a space (control-right). (In Settings > Keyboard > Shortcuts > Mission Control.)
- [ ] Map caps lock to escape on internal and external keyboards.
- [ ] Change Swipe between full screen apps to four fingers.
- [ ] Change Mission Control to four fingers.
- [ ] Change App Expose to four fingers.
- [ ] Change minimize windows to scale effect. (In Settings > Dock > Minimize windows using)
- [ ] Show Bluetooth in menu bar. (In Settings > Bluetooth)
- [ ] Connect to iPhone with Bluetooth.
- [ ] Display the time with seconds. (In Settings > Date & Time > Clock.)
- [ ] Show the date. (In Settings > Date & Time > Clock.)
- [ ] Set up Time Machine.
- [ ] Check "Show Time Machine in menu bar". (In Settings > Time Machine.)

## Finder Settings
- [ ] Display folder on top in Finder. (In Finder Preferences > Advanced)
- [ ] Remove items from trash after 30 days. (In Finder Preferences > Advanced)
- [ ] Change "New Finder window shows" to home folder. (In Finder Preferences > General.)
- [ ] Change 'Favorites' sidebar list to: home folder, Development, Downloads, Applications, Air Drop.
- [ ] Change 'Locations' sidebar list to: Conrad's MacBook Pro, Network

TODO: It'd be great to automate most of the above in the Mac setup script where possible.
This article tells how to determine changes being made: https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/#the-way-to-find-the-domain--key-responsible-for-a-setting

## Tmux
- [ ] Hit <prefix>+I to install plugins.

## Neovim
- [ ] Run :checkhealth.
- [ ] Run :PlugInstall.
- [ ] Install the following coc.nvim extensions (command is `:CocInstall [extenson]`:
  - coc-css
  - coc-html
  - coc-json
  - coc-solargraph
  - coc-tsserver
  - coc-tabnine
  - The [coc.nvim README](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#automation-script) has an automatic script you could set up.

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
* [ ] Bitdefender Virus Scanner
  * Install it manually.
  * Add these exceptions:
    * /Volumes/Mac Backup
    * /Volumes/.timemachine
    * /Volumes/com.apple.TimeMachine.localsnapshots
* [ ] Chrome
  * Install the [Markdown Viewer](https://github.com/simov/markdown-viewer) extension.
* [ ] Dash
  * Load License (In iCloud Drive > Software Licenses and Such.)
  * Set up syncing. Sync files are in iCloud Drive > Dash Sync.
* [ ] iTerm
  * Load configuration. (In this repo. Change in Settings > General > Preferences)
  * Change text to Hack Nerd Font regular 16 point. (Settings > Profiles > Text)
* [ ] Firefox Developer Edition
  * Import sessions into Tab Session Manager. The backup is in the Downloads folder.
* [ ] Kap
  * Turn on "Highlight clicks"
  * Change "Save to..." to "~/Downloads".
* [ ] Maccy
  * Change keyboard shortcut to Ctrl-Space
  * Update other settings.
* [ ] Messages
  * Turn on "Enable Messages in iCloud". (In Settings > iMessage.)
* [ ] Postgres.app
  * Download and install: https://postgresapp.com/downloads.html
* [ ] TablePlus
  * Enable Alert Mode 2. Warn before sending queries to the server except SELECT type queries.
* [ ] Screenshot App
  * Change save location to Downloads folder.
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
* BetterTouchTool
* Maccy
* Dash
* Jabra Direct
