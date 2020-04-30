############################################################################
#### Config vars

USERNAME=oriol.torrent
JIRA=https://jira.unic.com
JIRAPREFIX=NEWKTBE-
EDITOR=code

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="pygmalion"
export ZSH_THEME="powerlevel10k/powerlevel10k"

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


