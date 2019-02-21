source ./configs/installation.sh

function general_ui() {
  bot "General UI/UX"

  # running "Disable the sound effects on boot"
  # sudo nvram SystemAudioVolume=" "

  # running "Disable transparency in the menu bar and elsewhere on Yosemite"
  # defaults write com.apple.universalaccess reduceTransparency -bool true

  # running "Set highlight color to green"
  # defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

  # running "Set sidebar icon size to medium"
  # defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

  # running "Always show scrollbars"
  # defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
  # Possible values: 'WhenScrolling', 'Automatic' and 'Always'

  # running "Disable the over-the-top focus ring animation"
  # defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

  # running "Disable smooth scrolling"
  # "(Uncomment if you're on an older Mac that messes up the animation)"
  # defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

  running "Increase window resize speed for Cocoa applications"
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

  running "Expand save panel by default"
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  running "Expand print panel by default"
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  running "Save to disk (not to iCloud) by default"
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

  running "Automatically quit printer app once the print jobs complete"
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  running "Disable the 'Are you sure you want to open this application?' dialog"
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # running "Remove duplicates in the 'Open With' menu"
  # (also see 'lscleanup' alias)
  # /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

  # running "Display ASCII control characters using caret notation in standard text views"
  # Try e.g. 'cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt'
  # defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

  # running "Disable Resume system-wide"
  # defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

  # running "Disable automatic termination of inactive apps"
  # defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

  running "Disable the crash reporter"
  defaults write com.apple.CrashReporter DialogType -string "none"

  # running "Set Help Viewer windows to non-floating mode"
  # defaults write com.apple.helpviewer DevMode -bool true

  # "Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
  # "Commented out, as this is known to cause problems in various Adobe apps :(
  # "See https://github.com/mathiasbynens/dotfiles/issues/237
  # running "0x08000100:0" > ~/.CFUserTextEncoding

  running "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
  sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName IPAddress

  running "Add in some text to appear on the Login Window"
  # To remove the message: sudo defaults delete /Library/Preferences/com.apple.loginwindow LoginwindowText
  sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string “$LOGIN_WINDOW_TEXT”

  # running "Disable Notification Center and remove the menu bar icon"
  # launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

  # running "Disable automatic capitalization as it's annoying when typing code"
  # defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

  # running "Disable smart dashes as they're annoying when typing code"
  # defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  # running "Disable automatic period substitution as it's annoying when typing code"
  # defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

  # running "Disable smart quotes as they're annoying when typing code"
  # defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

  # running "Disable auto-correct"
  # defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  running "Enable auto-correct"
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true


  ###############################################################################
  bot "SSD-specific tweaks"
  ###############################################################################

  running "Disable the sudden motion sensor as it's not useful for SSDs"
  sudo pmset -a sms 0


  ###############################################################################
  bot "Trackpad, mouse, keyboard, Bluetooth accessories, and input"
  ###############################################################################

  running "Trackpad: enable tap to click for this user and for the login screen"
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

  running "Trackpad: map bottom right corner to right-click"
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

  running "Enable 'natural' (Lion-style) scrolling"
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

  running "Increase sound quality for Bluetooth headphones/headsets"
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

  running "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # running "Use scroll gesture with the Ctrl (^) modifier key to zoom"
  # defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
  # defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
  # running "Follow the keyboard focus while zoomed in"
  # defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

  # running "Disable press-and-hold for keys in favor of key repeat"
  # defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # running "Set a blazingly fast keyboard repeat rate"
  # defaults write NSGlobalDomain KeyRepeat -int 1
  # defaults write NSGlobalDomain InitialKeyRepeat -int 10

  # running "Set language and text formats"
  # Note: if you're in the US, replace `EUR` with `USD`, `Centimeters` with
  # `Inches`, `en_GB` with `en_US`, and `true` with `false`.
  defaults write -g AppleLanguages -array "en-CH"
  defaults write -g AppleLocale -string "en_CHB@currency=CHF"
  defaults write -g AppleMeasurementUnits -string "Centimeters"
  defaults write -g AppleMetricUnits -bool true

  running "Show language menu in the top right corner of the boot screen"
  sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

  running "Set the timezone"
  # see systemsetup -listtimezones for other values
  systemsetup -settimezone "Europe/Zurich" > /dev/null
  sudo systemsetup -setnetworktimeserver "time.euro.apple.com"
  sudo systemsetup -setusingnetworktime on

  # running "Stop iTunes from responding to the keyboard media keys"
  # launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

  ##########

  running "System Preferences > Accessibility > Mouse & Trackpad > Trackpad Options"
  # https://discussions.apple.com/thread/7387742
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

  defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false

  running "Automatically illuminate built-in MacBook keyboard in low light"
  defaults write com.apple.BezelServices kDim -bool true

  running "Turn off keyboard illumination when computer is not used for 5 minutes"
  defaults write com.apple.BezelServices kDimTime -int 300

  running "System Preferences > General > Click in the scrollbar to: Jump to the spot that's clicked"
  defaults write -globalDomain "AppleScrollerPagingBehavior" -bool true
}

function general_energy() {
  bot "General energy saving"

  running "Turns on lid wakeup"
  sudo pmset -a lidwake 1

  running "Automatic restart on power loss"
  sudo pmset -a autorestart 1

  running "Restart automatically if the computer freezes"
  sudo systemsetup -setrestartfreeze on

  # running "Remove the sleep image file to save disk space"
  # sudo rm /private/var/vm/sleepimage
  # running "Create a zero-byte file instead…"
  # sudo touch /private/var/vm/sleepimage
  # running "…and make sure it can't be rewritten"
  # sudo chflags uchg /private/var/vm/sleepimage
}

function general_screen() {
  bot "General Screen"

  running "Require password immediately after sleep or screen saver"
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  # running "Enable sub-pixel rendering on non-Apple LCDs"
  # Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
  # 1 light | 2 medium | 3 big
  # defaults write NSGlobalDomain AppleFontSmoothing -int 1

  running "Enable HiDPI display modes (requires restart)"
  sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
}

function general_finder() {
  bot "General Finder"

  running "Finder: show hidden files by default"
  defaults write com.apple.finder AppleShowAllFiles -bool true

  running "Finder: show all filename extensions"
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  running "Disable the warning when changing a file extension"
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  running "Avoid creating .DS_Store files on network or USB volumes"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  running "Show the ~/Library folder"
  chflags nohidden ~/Library

  running "Show the /Volumes folder"
  sudo chflags nohidden /Volumes

  running "Expand the following File Info panes:"
  running "'General', 'Open with', and 'Sharing & Permissions'"
  defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

  running "Enable text selection in quicklook"
  defaults write com.apple.finder QLEnableTextSelection -bool true
}

function general_dock() {
  bot "General Dock"

  running "Disable Dashboard"
  defaults write com.apple.dashboard mcx-disabled -boolean true

  running "Don't show Dashboard as a Space"
  defaults write com.apple.dock dashboard-in-overlay -bool true

  running "Enable highlight hover effect for the grid view of a stack (Dock)"
  defaults write com.apple.dock mouse-over-hilite-stack -bool true

  running "Don't automatically rearrange Spaces based on most recent use"
  defaults write com.apple.dock mru-spaces -bool false
}

function general_safari() {
  bot "General Safari & WebKit"

  running "Privacy: don't send search queries to Apple"
  defaults write com.apple.Safari UniversalSearchEnabled -bool false
  defaults write com.apple.Safari SuppressSearchSuggestions -bool true

  running "Show the full URL in the address bar (note: this still hides the scheme)"
  defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

  running "Prevent Safari from opening 'safe' files automatically after downloading"
  defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

  running "Enable Safari's debug menu"
  defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

  running "Make Safari's search banners default to Contains instead of Starts With"
  defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

  running "Enable the Develop menu and the Web Inspector in Safari"
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

  running "Add a context menu item for showing the Web Inspector in web views"
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

  running "Enable continuous spellchecking"
  defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

  running "Warn about fraudulent websites"
  defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

  running "Disable plug-ins"
  defaults write com.apple.Safari WebKitPluginsEnabled -bool false
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

  running "Disable Java"
  defaults write com.apple.Safari WebKitJavaEnabled -bool false
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

  running "Block pop-up windows"
  defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

  running "Enable 'Do Not Track'"
  defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

  running "Update extensions automatically"
  defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
}

function general_timemachine() {
  bot "General TimeMachine"

  running "Prevent Time Machine from prompting to use new hard drives as backup volume"
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

  running "Disable local Time Machine backups"
  hash tmutil &> /dev/null && sudo tmutil disablelocal
}

function general_other_apple_apps() {
  bot "General Address Book, Dashboard, iCal, TextEdit, and Disk Utility"

  running "Use plain text mode for new TextEdit documents"
  defaults write com.apple.TextEdit RichText -int 0

  running "Open and save files as UTF-8 in TextEdit"
  defaults write com.apple.TextEdit PlainTextEncoding -int 4
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

  running "Enable the debug menu in Disk Utility"
  defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
  defaults write com.apple.DiskUtility advanced-image-options -bool true

  running "Auto-play videos when opened with QuickTime Player"
  defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

  running "Prevent Photos from opening automatically when devices are plugged in"
  defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

  running "Disable the Ping sidebar in iTunes"
  defaults write com.apple.iTunes disablePingSidebar -bool true

  running "Disable all the other Ping stuff in iTunes"
  defaults write com.apple.iTunes disablePing -bool true

  running "Make ⌘ + F focus the search input in iTunes"
  defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"
}
