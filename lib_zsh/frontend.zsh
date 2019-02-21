############################################################################
#### Config vars

USERNAME=oriol.torrent
JIRA=https://jira.unic.com
JIRAPREFIX=NEWKTBE-
EDITOR=code

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="pygmalion"
ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
# ELEMENTS can be, among others: status, os_icon, load, context, dir, context, dir, rbenv, vcs
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time node_version rbenv)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true


############################################################################
#### Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


############################################################################
#### Fix for Powerline fonts seems to have issues with locale:
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


############################################################################
#### CONFIG for Jira ZSH plugin
JIRA_URL=$JIRA
JIRA_NAME=$USERNAME
JIRA_PREFIX=$JIRAPREFIX


############################################################################
#### CONFIG for some ZSH plugins
DEFAULT_USER=$USERNAME


############################################################################
# Avoid Node Error: EMFILE, too many open files
# default value: 256
ulimit -n 1024

# Fix for Javascript heap out memory
# (FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory)
# https://stackoverflow.com/a/48895989
export NODE_OPTIONS=--max_old_space_size=2048


