#!/usr/bin/env bash

#######################################
# Mac OS system configuration script
#######################################
# Portions derived from https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#########################
# Dock Configuration
#########################
# Keep the dock on the left hand side
defaults write com.apple.dock "orientation" -string "left"
# Keep the dock always visible
defaults write com.apple.dock autohide -bool false
# Set the standard icon size of Dock items to 36 pixels, magnification size to 50
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock largesize -int 50
# Enable magnification when hovering over dock itmes
defaults write com.apple.dock magnification -bool true
# Genie style minimization (default)
defaults write com.apple.dock "mineffect" -string "genie"


#persistent-apps = [
#    { app = "/System/Cryptexes/App/System/Applications/Safari.app"; }
#    { app = "/Applications/Vivaldi.app"; }
#    { app = "/Applications/Ghostty.app"; }
#    { app = "/Applications/Zed.app"; }
#    { app = "/Applications/Craft.app"; }
#    { app = "/Applications/Bear.app"; }
#    { app = "/System/Applications/Calculator.app"; }
#    { app = "/System/Applications/System Settings.app"; }
#    { app = "/System/Applications/App Store.app"; }
#];
#persistent-others = [
#    "/Applications" arrangement=1 (Name) showas=3 displayas=1 (folder)
#    "/Users/haley/Downloads" arrangment=2 (date added) showas=3 (list) displayas=1 (folder)
#];


#########################
# Hot Screen Corners
#########################
# Bottom right screen corner → Start screen saver
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0
# Bottom left screen corner → Put display to sleep
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

#########################
# Gestures
#########################
# Enable App Expose gesture (three fingers down)
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false
# When using mission control expose, group apps together
defaults write com.apple.dock expose-group-apps -bool true

#########################
# Finder
#########################
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Open new windows in home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
# Always use column view by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# Disable recent tags
defaults write com.apple.finder ShowRecentTags -bool false
# Show the ~/Library folder
echo "'No such xattr:' error on next line is ok"
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
#defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true


#########################
# Safari
#########################
# These don't seem to work anymore.  preferences moved elsewhere?
# Disable AutoFill
    #defaults write com.apple.Safari AutoFillFromAddressBook -bool false
    #defaults write com.apple.Safari AutoFillPasswords -bool false
    #defaults write com.apple.Safari AutoFillCreditCardData -bool false
    #defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
# Prevent Safari from opening ‘safe’ files automatically after downloading
    #defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Enable “Do Not Track”
    #defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
# Update extensions automatically
    #defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


#########################
# TextEdit
#########################
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4





###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" \
    "Finder" \
    "SystemUIServer" ; do
	killall "${app}" &> /dev/null
done

#    "Activity Monitor" \
#	"Address Book" \
#	"Calendar" \
#	"cfprefsd" \
#	"Contacts" \
#	"Google Chrome Canary" \
#	"Google Chrome" \
#	"Mail" \
#	"Messages" \
#	"Opera" \
#	"Photos" \
#	"Safari" \
#	"SizeUp" \
#	"Spectacle" \
#	"Terminal" \
#	"iCal"; do

echo "Done. Note that some of these changes require a logout/restart to take effect."
