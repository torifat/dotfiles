# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# Chime When Charging
# Play iOS charging sound when MagSafe is connected.
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && \
  open /System/Library/CoreServices/PowerChime.app

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null


## General UI/UX
# -g is shorthand for NSGlobalDomain
# Set highlight color to green
defaults write -g AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

killall SystemUIServer


## Finder

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

killall Finder


## Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 48

killall Dock


## iStat Menus
# 1 - CPU & GPU, 2 - Memory, 3 - Disks, 4 - Network, 5 - Sensors, 6 - Battery, 7 - Time

# Widgets in Menu
defaults write com.bjango.istatmenus5.extras CombinedMenubarDisplayMode -int 4

# Combined widgets order
defaults write com.bjango.istatmenus5.extras CombinedDropdownDisplayMode -string 4,1,2,3,5,6

# Show Launcher
defaults write com.bjango.istatmenus5.extras DropdownShowLauncher -integer 1

# Dark Theme
defaults write com.bjango.istatmenus5.extras DropdownTheme -int 1

killall "iStat Menus Status"
