#!/usr/bin/env bash


###########################
# This script installs the dotfiles and runs all other system configuration scripts
###########################

#
# Reasonably sets OS X defaults. Sources:
#  - https://github.com/atomantic/dotfiles
#  - https://gist.github.com/garethrees/2470157
#  - https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
#  - https://github.com/nicksp/dotfiles/blob/master/osx/set-defaults.sh
#  - https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# ~/dotfiles/osx/set-defaults.sh — http://mths.be/osx
#


###############################################################################
# PREPARATION
###############################################################################

# include my library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh
source ./configs/installation.sh
source ./lib_sh/system_adjustments_general.sh
source ./lib_sh/system_adjustments_opinionated.sh

bot "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

# Ask for the administrator password upfront
bot "I may need you to enter your sudo password so I can install some things:"
sudo -v

# Keep-alive: update existing sudo time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



###############################################################################
# Creating directories                                                        #
###############################################################################

bot "Creating directories"

running "Creating $work_dir..."
if [[ ! -e "$work_dir" ]]; then
  mkdir $work_dir
  ok
else
  info "Already created"
fi

running "Creating $tools_dir..."
if [[ ! -e "$tools_dir" ]]; then
  mkdir $tools_dir
  ok
else
  info "Already created"
fi

running "Creating $nvm_dir..."
if [[ ! -e "$nvm_dir" ]]; then
  mkdir $nvm_dir
  ok
else
  info "Already created"
fi


###############################################################################
# HOSTS                                                                       #
###############################################################################

bot "setting up hosts"
read -r -p "Overwrite /etc/hosts with the ad-blocking hosts file from someonewhocares.org? (from ./configs/hosts file) [y|N] " response
if [[ $response =~ (yes|y|Y) ]];then
    action "cp /etc/hosts /etc/hosts.backup"
    sudo cp /etc/hosts /etc/hosts.backup
    ok
    action "cp ./configs/hosts /etc/hosts"
    sudo cp ./configs/hosts /etc/hosts
    ok
    bot "Your /etc/hosts file has been updated. Last version is saved in /etc/hosts.backup"
else
  info "hosts were left untouched"
fi


###############################################################################
# GITHUB                                                                      #
###############################################################################

bot "Let's setup your Github account"
grep 'user = GITHUBUSER' ./homedir/.gitconfig > /dev/null 2>&1
if [[ $? = 0 ]]; then
    read -r -p "What is your github.com username? " githubuser

  fullname=`osascript -e "long user name of (system info)"`

  if [[ -n "$fullname" ]];then
    lastname=$(echo $fullname | awk '{print $2}');
    firstname=$(echo $fullname | awk '{print $1}');
  fi

  if [[ -z $lastname ]]; then
    lastname=`dscl . -read /Users/$(whoami) | grep LastName | sed "s/LastName: //"`
  fi
  if [[ -z $firstname ]]; then
    firstname=`dscl . -read /Users/$(whoami) | grep FirstName | sed "s/FirstName: //"`
  fi
  email=`dscl . -read /Users/$(whoami)  | grep EMailAddress | sed "s/EMailAddress: //"`

  if [[ ! "$firstname" ]];then
    response='n'
  else
    echo -e "I see that your full name is $COL_YELLOW$firstname $lastname$COL_RESET"
    read -r -p "Is this correct? [Y|n] " response
  fi

  if [[ $response =~ ^(no|n|N) ]];then
    read -r -p "What is your first name? " firstname
    read -r -p "What is your last name? " lastname
  fi
  fullname="$firstname $lastname"

  bot "Great $fullname, "

  if [[ ! $email ]];then
    response='n'
  else
    echo -e "The best I can make out, your email address is $COL_YELLOW$email$COL_RESET"
    read -r -p "Is this correct? [Y|n] " response
  fi

  if [[ $response =~ ^(no|n|N) ]];then
    read -r -p "What is your email? " email
    if [[ ! $email ]];then
      error "you must provide an email to configure .gitconfig"
      exit 1
    fi
  fi


  running "replacing items in .gitconfig with your info ($COL_YELLOW$fullname, $email, $githubuser$COL_RESET)"

  # test if gnu-sed or MacOS sed

  sed -i "s/GITHUBFULLNAME/$firstname $lastname/" ./homedir/.gitconfig > /dev/null 2>&1 | true
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    echo
    running "looks like you are using MacOS sed rather than gnu-sed, accommodating"
    sed -i '' "s/GITHUBFULLNAME/$firstname $lastname/" ./homedir/.gitconfig;
    sed -i '' 's/GITHUBEMAIL/'$email'/' ./homedir/.gitconfig;
    sed -i '' 's/GITHUBUSER/'$githubuser'/' ./homedir/.gitconfig;
    ok
  else
    echo
    bot "looks like you are already using gnu-sed. woot!"
    sed -i 's/GITHUBEMAIL/'$email'/' ./homedir/.gitconfig;
    sed -i 's/GITHUBUSER/'$githubuser'/' ./homedir/.gitconfig;
  fi
fi


###############################################################################
# Homebrew                                                                    #
###############################################################################

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
  action "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
      error "unable to install homebrew, script $0 abort!"
      exit 2
  fi
else
  ok
  # Make sure we're using the latest Homebrew
  running "updating homebrew"
  brew update
  ok
  bot "before installing brew packages, we can upgrade any outdated packages."
  read -r -p "run brew upgrade? [y|N] " response
  if [[ $response =~ ^(y|yes|Y) ]];then
      # Upgrade any already-installed formulae
      action "upgrade brew packages..."
      brew upgrade
      ok "brews updated..."
  else
      ok "skipped brew package upgrades.";
  fi
fi

running "opting out from Homebrew analytics"
brew analytics off


##############################################################################
# Homebrew bundle                                                            #
##############################################################################

running "installing homebrew bundle"
# https://github.com/Homebrew/homebrew-bundle
brew bundle install --verbose
ok


###############################################################################
# ZSH                                                                         #
###############################################################################

bot "setting zsh as the user login shell"
CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
  bot "setting newer homebrew zsh (/usr/local/bin/zsh) as your shell (password required)"
  # sudo bash -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
  # chsh -s /usr/local/bin/zsh
  sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
  ok
fi

running "copying custom ZSH files"
action "cp lib_zsh/*.zsh oh-my-zsh/custom"
cp lib_zsh/*.zsh oh-my-zsh/custom
ok

running "installing powerLevel10k theme"
if [[ ! -d "./oh-my-zsh/custom/themes/powerlevel10k" ]]; then
  git clone https://github.com/romkatv/powerlevel10k.git oh-my-zsh/custom/themes/powerlevel10k
fi
ok

running "installing Nerd fonts"
# https://github.com/ryanoasis/nerd-fonts
brew cask install $( brew search nerd-font | awk '/nerd-font/ && !/-mono$/' | tr '\n' ' ' )
ok

running "installing useful key bindings and fuzzy completion"
# https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
# https://sourabhbajaj.com/mac-setup/iTerm/fzf.html
$(brew --prefix)/opt/fzf/install
ok

running "activating zsh-completions"
# make sure the path has the correct permissions to avoid insecrure directories warning:
# https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
sudo chmod -R 755 /usr/local/share
rm -f ~/.zcompdump; compinit
ok

running "adding zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ok

running "adding zsh-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ok

running "making sure ZSH is up to date"
# the same than calling 'upgrade_oh_my_zsh' in a ZSH environment
env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
ok


###############################################################################
# DOTFILES                                                                    #
###############################################################################

bot "creating symlinks for project dotfiles..."
pushd homedir > /dev/null 2>&1
now=$(date +"%Y.%m.%d.%H.%M.%S")

for file in .*; do
  if [[ $file == "." || $file == ".." ]]; then
    continue
  fi
  running "~/$file"
  # if the file exists:
  if [[ -e ~/$file ]]; then
      mkdir -p ~/.dotfiles_backup/$now
      mv ~/$file ~/.dotfiles_backup/$now/$file
      echo "backup saved as ~/.dotfiles_backup/$now/$file"
  fi
  # symlink might still exist
  unlink ~/$file > /dev/null 2>&1
  # create the link
  ln -s ~/.dotfiles/homedir/$file ~/$file
  echo -en '\tlinked';ok
done

popd > /dev/null 2>&1


###############################################################################
# VIM                                                                         #
###############################################################################

bot "installing vim plugins"
# cmake is required to compile vim bundle YouCompleteMe
# require_brew cmake
vim +PluginInstall +qall > /dev/null 2>&1
ok


###############################################################################
# NVM                                                                         #
###############################################################################

bot "installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$nvm_latest_version/install.sh | bash
ok

# source nvm: https://unix.stackexchange.com/questions/184508/nvm-command-not-available-in-bash-script
# source $(brew --prefix nvm)/nvm.sh # if installed via Brew; you shouldn't
source ${HOME}/.nvm/nvm.sh

bot "installing latest lts node version"
nvm install --lts
ok

# always pin versions (no surprises, consistent dev/build machines)
running "always pin versions (save-exact) for 'npm i'"
npm config set save-exact true
ok


#####################################
# SYSTEM
#####################################

bot "Let's adjust the system..."
sleep 1

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
running "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'
ok

###############################################################################
function general_adjustments() {
  general_ui
  general_energy
  general_screen
  general_finder
  general_dock
  general_safari
  general_timemachine
  general_other_apple_apps
}

function opinionated_adjustments {
	opinionated_ui
	opinionated_energy
	opinionated_screen
	opinionated_finder
	opinionated_dock
  opinionated_safari
  opinionated_mail
  opinionated_terminal
  opinionated_activity_monitor
  # opinionated_app_store
  opinionated_chrome
  opinionated_other_apps
}


read -r -p "Would you like to do the general system adjustments? [y|N] " response
if [[ $response =~ (yes|y|Y) ]];then
    action "Setting general adjustments"
	general_adjustments
    ok "System adjustments applied! ☺️"
else
  info "Adjustments were left untouched"
fi

read -r -p "Would you like to do the more opinionated system adjustments (You should check them and adapt them to you liking)? [y|N] " response
if [[ $response =~ (yes|y|Y) ]];then
    action "Setting opinionated adjustments"
	opinionated_adjustments
    ok "System adjustments applied! ☺️"
else
  info "Adjustments were left untouched"
fi


###############################################################################
# Kill affected applications                                                  #
###############################################################################

bot "OK. Note that some of these changes require a logout/restart to take effect. Killing affected applications (so they can reboot)...."

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done

# Wait a bit before moving on...
sleep 1

ok

# ...and then.
bot "Woot! All done. Kill this terminal and launch iTerm"


###############################################################################
bot "Reboot"
###############################################################################

# See if the user wants to reboot.
function reboot() {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | N | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

# Call on the function
if [[ "Yes" == $(reboot) ]]
then
  echo "Rebooting."
  sudo reboot
  exit 0
else
  exit 1
fi
