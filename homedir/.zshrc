# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This sets up colors properly
export TERM="xterm-256color"

# set shell
export SHELL=/bin/zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

################################################################
# Custom profile: Start
################################################################
source ~/.profile
################################################################
# Custom profile: End
################################################################


################################################################
# Setup ZSH: Start
################################################################
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	autojump
	autoupdate
	brew
	git
	colored-man-pages
	colorize
	compleat
	cp
	dircycle
	dirhistory
	dirpersist
	dnf
	docker
	docker-compose
	git
	git-extras
	git-flow-avh
	git-prompt
	github
	history
	node
	npm
	nvm
	macos
	web-search
	yarn
	zsh-autosuggestions
	zsh-z
	zsh-syntax-highlighting
)

# Setup zsh autocorrection
unsetopt correct
################################################################
# Setup ZSH: End
################################################################


################################################################
# FZF: Start
################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
################################################################
# FZF: End
################################################################


################################################################
# Brew completions: Start
################################################################
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
# Configuring Completions in zsh
# To make Homebrew’s completions available in zsh, you must insert the Homebrew-managed zsh/site-functions path into your FPATH before initialising zsh’s completion facility. Add the following to your ~/.zshrc:

# if type brew &>/dev/null
# then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

#   autoload -Uz compinit
#   compinit
# fi
# This must be done before compinit is called. Note that if you are using Oh My Zsh, it will call compinit for you when you source oh-my-zsh.sh. In this case, instead of the above, add the following line to your ~/.zshrc, before you source oh-my-zsh.sh:

# FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# You may also need to forcibly rebuild zcompdump:

# rm -f ~/.zcompdump; compinit
# Additionally, if you receive “zsh compinit: insecure directories” warnings when attempting to load these completions, you may need to run this:

# chmod -R go-w "$(brew --prefix)/share"

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
################################################################
# Brew completions: End
################################################################


################################################################
# Source oh-my-zsh framework: Start
################################################################
source $ZSH/oh-my-zsh.sh
# source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
################################################################
# Source oh-my-zsh framework: End
################################################################


################################################################
# P10k: Start
################################################################
# To customize prompt, run `p10k configure` or edit ~/.dotfiles/homedir/.p10k.zsh.
[[ ! -f ~/.dotfiles/homedir/.p10k.zsh ]] || source ~/.dotfiles/homedir/.p10k.zsh
################################################################
# P10k: End
################################################################


################################################################
# SSH: Start
################################################################
# export SSH_KEY_PATH="~/.ssh/rsa_id"
################################################################
# SSH: End
################################################################


################################################################
# NVM: Start
################################################################
# https://github.com/nvm-sh/nvm#zsh
# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
################################################################
# NVM: End
################################################################


################################################################
# VSCode shell integration: Start
# https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
################################################################
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
################################################################
# VSCode shell integration: End
################################################################


################################################################
# ZSH syntax highlighting: Start
# zsh-syntax-highlighting must be sourced at the end
################################################################
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
################################################################
# ZSH syntax highlighting: End
################################################################


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/dotnet@6/bin:$PATH"
export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
