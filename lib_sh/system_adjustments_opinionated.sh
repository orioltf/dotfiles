function opinionated_ui() {
	bot "Opinionated UI/UX"

	running "Configure menu-extras in the menu bar"
	defaults write com.apple.systemuiserver menuExtras -array \
		"/System/Library/CoreServices/Menu Extras/TextInput.menu" \
		"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
		"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
		"/System/Library/CoreServices/Menu Extras/Battery.menu" \
		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
		"/System/Library/CoreServices/Menu Extras/Clock.menu"

	running "Show remaining battery percentage"
	defaults write com.apple.menuextra.battery ShowPercent -string "YES"

	# Not available in 10.14 Mojave
	# running "Show remaining battery time"
	# defaults write com.apple.menuextra.battery ShowTime -string "NO"
}

function opinionated_energy() {
	bot "Opinionated energy saving"

	running "Sets displaysleep to 15 minutes"
	sudo pmset -a displaysleep 15

	running "Do not allow machine to sleep on charger"
	sudo pmset -c sleep 0

	running "Set machine sleep to 5 minutes on battery"
	sudo pmset -b sleep 5

	# running "Set standby delay to 24 hours (default is 1 hour)"
	# sudo pmset -a standbydelay 86400

	# running "Never go into computer sleep mode"
	# sudo systemsetup -setcomputersleep Off > /dev/null

	# running "Hibernation mode"
	# 0: Disable hibernation (speeds up entering sleep mode)
	# 3: Copy RAM to disk so the system state can still be restored in case of a
	#    power failure.
	# sudo pmset -a hibernatemode 0
}

function opinionated_screen() {
	bot "Opinionated Screen"

	running "Save screenshots to a folders 'Screenshots' folder in desktop"
	defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

	running "Save screenshots in PNG format"
	# (other options: BMP, GIF, JPG, PDF, TIFF)
	defaults write com.apple.screencapture type -string "png"

	# running "Disable shadow in screenshots"
	# defaults write com.apple.screencapture disable-shadow -bool true

	running "Disable Font Smoothing Disabler in macOS Mojave"
	# Reference: https://ahmadawais.com/fix-macos-mojave-font-rendering-issue/
	defaults write -g CGFontRenderingFontSmoothingDisabled -bool FALSE

	running "Enable HiDPI display modes (requires restart)"
	sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

	running "Minimum font size for antialiasing"
	# default is 4
	defaults write NSGlobalDomain AppleAntiAliasingThreshold -int 2
}

function opinionated_finder() {
	bot "Opinionated Finder"

	# running "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
	# defaults write com.apple.finder QuitMenuItem -bool true

	# running "Finder: disable window animations and Get Info animations"
	# defaults write com.apple.finder DisableAllAnimations -bool true

	running "Set Home as the default location for new Finder windows"
	# For other paths, use `PfLo` and `file:///full/path/here/`
	defaults write com.apple.finder NewWindowTarget -string "PfLo"
	defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Sites/"

	running "Set the Finder prefs for showing a few different volumes on the Desktop"
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
	defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

	running "Finder: show status bar"
	defaults write com.apple.finder ShowStatusBar -bool true

	running "Finder: show path bar"
	defaults write com.apple.finder ShowPathbar -bool true

	running "Display full POSIX path as Finder window title"
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

	running "Keep folders on top when sorting by name"
	defaults write com.apple.finder _FXSortFoldersFirst -bool true

	running "When performing a search, search the current folder by default"
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

	running "Enable spring loading for directories"
	defaults write NSGlobalDomain com.apple.springing.enabled -bool true
	# running "Remove the spring loading delay for directories"
	# defaults write NSGlobalDomain com.apple.springing.delay -float 0

	# running "Disable disk image verification"
	# defaults write com.apple.frameworks.diskimages skip-verify -bool true
	# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
	# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
	running "Automatically open a new Finder window when a volume is mounted"
	defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
	defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
	defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

	running "Show item info near icons on the desktop and in other icon views"
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

	running "Show item info to the right of the icons on the desktop"
	/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

	running "Enable snap-to-grid for icons on the desktop and in other icon views"
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

	running "Increase grid spacing for icons on the desktop and in other icon views"
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 70" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 70" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 70" ~/Library/Preferences/com.apple.finder.plist

	running "Increase the size of icons on the desktop and in other icon views"
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist
	/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist

	running "Use columns view in all Finder windows by default"
	# Four-letter codes for the other view modes: `icnv`, "Nlsv", `clmv`, `Flwv`
	defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

	# running "Disable the warning before emptying the Trash"
	# defaults write com.apple.finder WarnOnEmptyTrash -bool false

	# running "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
	# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

	# running "Remove Dropbox's green checkmark icons in Finder"
	# file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
	# [ -e "${file}" ] && mv -f "${file}" "${file}.bak"

	running "Finder > Preferences > Disable warning before removing from iCloud Drive"
	defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
}

function opinionated_dock() {
	bot "Opinionated Dock"

	running "Set the icon size of Dock items to 32 pixels"
	defaults write com.apple.dock tilesize -int 32

	running "Change minimize/maximize window effect"
	# "scale" or "genie"
	defaults write com.apple.dock mineffect -string "genie"

	running "Don't minimize windows into their application's icon"
	defaults write com.apple.dock minimize-to-application -bool false

	running "Enable spring loading for all Dock items"
	defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

	running "Show indicator lights for open applications in the Dock"
	defaults write com.apple.dock show-process-indicators -bool true

	running "Wipe all (default) app icons from the Dock"
	# This is only really useful when setting up a new Mac, or if you don't use
	# the Dock to launch apps.
	defaults write com.apple.dock persistent-apps -array
	# defaults delete com.apple.dock persistent-apps
	# defaults delete com.apple.dock persistent-others

	# running "Show only open applications in the Dock"
	# defaults write com.apple.dock static-only -bool true

	# running "Don't animate opening applications from the Dock"
	# defaults write com.apple.dock launchanim -bool false

	running "Speed up Mission Control animations"
	defaults write com.apple.dock expose-animation-duration -float 0.1

	running "Don't group windows by application in Mission Control"
	# (i.e. use the old Exposé behavior instead)
	defaults write com.apple.dock expose-group-by-app -bool false

	# running "Remove the auto-hiding Dock delay"
	# defaults write com.apple.dock autohide-delay -float 0
	# running "Remove the animation when hiding/showing the Dock"
	# defaults write com.apple.dock autohide-time-modifier -float 0
	running "Set the animation when hiding/showing the Dock"
	defaults write com.apple.dock autohide-time-modifier -float 0.5

	running "Automatically hide and show the Dock"
	defaults write com.apple.dock autohide -bool true

	running "Make Dock icons of hidden applications translucent"
	defaults write com.apple.dock showhidden -bool true

	# running "Don't show recent applications in Dock"
	# defaults write com.apple.dock show-recents -bool false

	# running "Disable the Launchpad gesture (pinch with thumb and three fingers)"
	# defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

	# running "Reset Launchpad, but keep the desktop wallpaper intact"
	# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

	# running "Add iOS & Watch Simulator to Launchpad"
	# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
	# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

	# Add a spacer to the left side of the Dock (where the applications are)
	# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
	# Add a spacer to the right side of the Dock (where the Trash is)
	# defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

	# Hot corners
	# Possible values:
	#   0: no-op
	#   2: Mission Control
	#   3: Show application windows
	#   4: Desktop
	#   5: Start screen saver
	#   6: Disable screen saver
	#   7: Dashboard
	#  10: Put display to sleep
	#  11: Launchpad
	#  12: Notification Center
	# defaults write com.apple.dock wvous-bl-corner -int 5
	# defaults write com.apple.dock wvous-bl-modifier -int 0

	running "Configure hot corners:"
	running "Set bottom-left: Put display to sleep"
	defaults write com.apple.dock wvous-bl-corner -int 10
	defaults write com.apple.dock wvous-bl-modifier -int 0
	running "Set bottom-right: Show Desktop"
	defaults write com.apple.dock wvous-br-corner -int 4
	defaults write com.apple.dock wvous-br-modifier -int 0
	running "Set top-left: Mission Control"
	defaults write com.apple.dock wvous-tl-corner -int 2
	defaults write com.apple.dock wvous-tl-modifier -int 0
	running "Set top-right: Show application windows"
	defaults write com.apple.dock wvous-tr-corner -int 3
	defaults write com.apple.dock wvous-tr-modifier -int 0

	running "System Preferences > Dock > Size (magnified)"
	defaults write com.apple.dock largesize -int 63

	running "System Preferences > Dock > Magnification"
	defaults write com.apple.dock magnification -bool true

	running "System Preferences > Dock > Orientation"
	# can be top, bottom, left, right
	defaults write com.apple.dock orientation -string bottom

	# running "Remove the delay for showing the Dock in full screen"
	# defaults write com.apple.dock autohide-fullscreen-delayed -bool false

	running "Create macOS Dock recent items stacks"
	defaults write com.apple.dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}'
}

function opinionated_safari() {
	bot "Opinionated Safari & WebKit"

	running "Press Tab to highlight each item on a web page"
	defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

	# running "Set Safari's home page to `about:blank` for faster loading"
	# defaults write com.apple.Safari HomePage -string "about:blank"

	running "Allow hitting the Backspace key to go to the previous page in history"
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

	running "Hide Safari's bookmark bar"
	defaults write com.apple.Safari ShowFavoritesBar -bool false

	running "Hide Safari's sidebar in Top Sites"
	defaults write com.apple.Safari ShowSidebarInTopSites -bool false

	running "Disable Safari's thumbnail cache for History and Top Sites"
	defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

	running "Remove useless icons from Safari's bookmarks bar"
	defaults write com.apple.Safari ProxiesInBookmarksBar "()"

	# running "Disable auto-correct"
	# defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

	running "Disable AutoFill"
	defaults write com.apple.Safari AutoFillFromAddressBook -bool false
	defaults write com.apple.Safari AutoFillPasswords -bool false
	defaults write com.apple.Safari AutoFillCreditCardData -bool false
	defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
}

function opinionated_mail() {
	bot "Opinionated Mail"

	# running "Disable send and reply animations in Mail.app"
	# defaults write com.apple.mail DisableReplyAnimations -bool true
	# defaults write com.apple.mail DisableSendAnimations -bool true

	running "Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
	defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

	running "Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app"
	defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

	running "Display emails in threaded mode, sorted by date (oldest at the top)"
	defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
	defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
	defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

	running "Disable inline attachments (just show the icons)"
	defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

	# running "Disable automatic spell checking"
	# defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"
}

function opinionated_terminal() {
	bot "Opinionated Terminal & iTerm 2"

	# running "Only use UTF-8 in Terminal.app"
	# defaults write com.apple.terminal StringEncodings -array 4

	# running "Enable 'focus follows mouse' for Terminal.app and all X11 apps"
	# i.e. hover over a window and start typing in it without clicking first
	# defaults write com.apple.terminal FocusFollowsMouse -bool true
	# defaults write org.x.X11 wm_ffm -bool true

	# running "Enable Secure Keyboard Entry in Terminal.app"
	# See: https://security.stackexchange.com/a/47786/8918
	# defaults write com.apple.terminal SecureKeyboardEntry -bool true

	# running "Disable the annoying line marks"
	# defaults write com.apple.Terminal ShowLineMarks -int 0

	#running "Install the Solarized Dark theme for iTerm"
	#open "${HOME}/init/Solarized Dark.itermcolors"

	#running "Don't display the annoying prompt when quitting iTerm"
	#defaults write com.googlecode.iterm2 PromptOnQuit -bool false

	running "installing terminal themes"
	git clone https://github.com/lysyi3m/macos-terminal-themes.git ${tools_dir}/macos-terminal-themes

	action "open the theme, so that it is included in the Library"
	open ${tools_dir}/macos-terminal-themes/schemes/${TERMINAL_THEME}.terminal

	running "seting Terminal defaults"
	# https://redlinetech.wordpress.com/2015/03/18/scripting-the-default-terminal-theme-in-os-x/
	sudo -u $USER defaults write /Users/$USER/Library/Preferences/com.apple.Terminal.plist "Default Window Settings" "FrontEndDelight"
	sudo -u $USER defaults write /Users/$USER/Library/Preferences/com.apple.Terminal.plist "Startup Window Settings" "FrontEndDelight"

	#set window width to 180
	sudo /usr/libexec/PlistBuddy -c "Add :Window\ Settings:FrontEndDelight:columnCount integer 180" /Users/$USER/Library/Preferences/com.apple.Terminal.plist
	defaults write /Users/$USER/Library/Preferences/com.apple.Terminal.plist "NSWindow Frame TTWindow FrontEndDelight" "187 65 640 778 0 0 1440 877 "

}

function opinionated_activity_monitor() {
	bot "Opinionated Activity Monitor"

	running "Show the main window when launching Activity Monitor"
	defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

	running "Visualise CPU usage in the Activity Monitor Dock icon"
	defaults write com.apple.ActivityMonitor IconType -int 5

	running "Show all processes in Activity Monitor"
	defaults write com.apple.ActivityMonitor ShowCategory -int 0

	running "Sort Activity Monitor results by CPU usage"
	defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
	defaults write com.apple.ActivityMonitor SortDirection -int 0
}

function opinionated_app_store() {
	bot "Mac App Store"

	running "Enable the WebKit Developer Tools in the Mac App Store"
	defaults write com.apple.appstore WebKitDeveloperExtras -bool true

	running "Enable Debug Menu in the Mac App Store"
	defaults write com.apple.appstore ShowDebugMenu -bool true

	running "Enable the automatic update check"
	defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

	running "Check for software updates daily, not just once per week"
	defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

	running "Download newly available updates in background"
	defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

	running "Install System data files & security updates"
	defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

	running "Automatically download apps purchased on other Macs"
	defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

	running "Turn on app auto-update"
	defaults write com.apple.commerce AutoUpdate -bool true

	running "Allow the App Store to reboot machine on macOS updates"
	defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
}

function opinionated_chrome() {
	bot "Opinionated Google Chrome & Google Chrome Canary"

	running "Disable the all too sensitive backswipe on trackpads"
	defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
	defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

	running "Disable the all too sensitive backswipe on Magic Mouse"
	defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
	defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

	running "Use the system-native print preview dialog"
	defaults write com.google.Chrome DisablePrintPreview -bool true
	defaults write com.google.Chrome.canary DisablePrintPreview -bool true

	running "Expand the print dialog by default"
	defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
	defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
}

function opinionated_other_apps() {
	###############################################################################
	bot "GPGMail 2"
	###############################################################################

	running "Disable signing emails by default"
	defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool false


	###############################################################################
	bot "Opera & Opera Developer"
	###############################################################################

	running "Expand the print dialog by default"
	defaults write com.operasoftware.Opera PMPrintingExpandedStateForPrint2 -boolean true
	defaults write com.operasoftware.OperaDeveloper PMPrintingExpandedStateForPrint2 -boolean true


	###############################################################################
	bot "Spectacle.app"
	###############################################################################

	running "Set up my preferred keyboard shortcuts"
	cp -r configs/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null
}
