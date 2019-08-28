# -g is shorthand for NSGlobalDomain

# Enable tap-clicking
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.mouse.tapBehavior -int 1

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

## General UI/UX
# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Change Screenshots location
defaults write com.apple.screencapture location ~/Pictures/Screenshots

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

# Add Screenshots to dock
# defaults write com.apple.dock persistent-others -array-add '{ tile-data={ arrangement=2; file-data={ _CFURLString="file:///Users/rnabi/Pictures/Screenshots/"; _CFURLStringType= 15; }; file-label="Screenshots"; file-type=2; preferreditemsize=-1; showas=1; }; tile-type="directory-tile"; }'

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
