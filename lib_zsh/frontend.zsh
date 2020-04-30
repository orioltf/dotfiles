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
#### Configure Theme

# POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_MODE='awesome-fontconfig'

# ELEMENTS can be, among others: status, os_icon, load, context, dir, context, dir, rbenv, vcs
# https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context node_version dir vcs nvm)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(node_version dir vcs nvm)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status disk_usage ram time)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(disk_usage load status history time node_version rbenv)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

####
POWERLEVEL9K_SHOW_RULER=true
POWERLEVEL9K_RULER_CHAR='─'
POWERLEVEL9K_RULER_BACKGROUND=none
POWERLEVEL9K_RULER_FOREGROUND=237

POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_RIGHT_SEGMENT_END_SEPARATOR=
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

POWERLEVEL9K_DIR_SHOW_WRITABLE=true

POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND=none
POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND=magenta
POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND=red
POWERLEVEL9K_TIME_BACKGROUND=none
POWERLEVEL9K_TIME_FOREGROUND=white

POWERLEVEL9K_DIR_HOME_BACKGROUND=none
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=none
POWERLEVEL9K_DIR_ETC_BACKGROUND=none
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=none
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND=none

POWERLEVEL9K_DIR_HOME_FOREGROUND=blue
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=blue
POWERLEVEL9K_DIR_ETC_FOREGROUND=blue
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=blue
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND=red

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

POWERLEVEL9K_VCS_GIT_ICON='%fon %F{040}\uf1d3 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='%fon %F{040}\uf09b '
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON='%fon %F{040}\uf171 '
POWERLEVEL9K_VCS_GIT_GIT_GITLAB_ICON='%fon %F{040}\uf296 '

POWERLEVEL9K_VCS_CLEAN_BACKGROUND=none
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=none
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=none
POWERLEVEL9K_VCS_LOADING_BACKGROUND=none
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="040"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="red"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_LOADING_FOREGROUND="grey"

POWERLEVEL9K_VCS_UNTRACKED_ICON=$'%{\b?%}'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'%{\b!%}'
POWERLEVEL9K_VCS_STAGED_ICON=$'%{\b+%}'

POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_COLOR=red
POWERLEVEL9K_LOCK_ICON=$'\uf023'

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# Prompt symbol: '❮' when vicmd keymap is active, '❯` otherwise; red on error, green on success.
local p='%F{%(?.green.red)}${${${KEYMAP:-0}:#vicmd}:+❯}${${$((!${#${KEYMAP:-0}:#vicmd})):#0}:+❮}%f '
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$p"

# POWERLEVEL9K_NVM_BACKGROUND=none
# POWERLEVEL9K_NVM_FOREGROUND=green
POWERLEVEL9K_NODE_ICON='%fvia %F{white}⬢'

# colorcode test
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
POWERLEVEL9K_NVM_FOREGROUND='000'
POWERLEVEL9K_NVM_BACKGROUND='072'
POWERLEVEL9K_SHOW_CHANGESET=true

POWERLEVEL9K_STATUS_VERBOSE=false
############ END- POWERLEVEL THEME SETTINGS ##############


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


