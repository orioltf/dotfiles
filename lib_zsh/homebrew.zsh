############################################################################
#### Homebrew Caveats

# ==> libffi
# libffi is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# For compilers to find libffi you may need to set:
#   export LDFLAGS="-L/usr/local/opt/libffi/lib"
#   export CPPFLAGS="-I/usr/local/opt/libffi/include"

# For pkg-config to find libffi you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"


# ==> unbound
# To have launchd start unbound now and restart at startup:
#   sudo brew services start unbound
# ==> readline
# readline is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides BSD libedit.

# For compilers to find readline you may need to set:
#   export LDFLAGS="-L/usr/local/opt/readline/lib"
#   export CPPFLAGS="-I/usr/local/opt/readline/include"

# For pkg-config to find readline you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"


# ==> sqlite
# sqlite is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have sqlite first in your PATH run:
#   echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.zshrc

# For compilers to find sqlite you may need to set:
#   export LDFLAGS="-L/usr/local/opt/sqlite/lib"
#   export CPPFLAGS="-I/usr/local/opt/sqlite/include"

# For pkg-config to find sqlite you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"


# ==> python@3.8
# Python has been installed as
#   /usr/local/bin/python3

# Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
# `python3`, `python3-config`, `pip3` etc., respectively, have been installed into
#   /usr/local/opt/python@3.8/libexec/bin

# You can install Python packages with
#   pip3 install <package>
# They will install into the site-package directory
#   /usr/local/lib/python3.8/site-packages

# See: https://docs.brew.sh/Homebrew-and-Python


# ==> glib
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d


# ==> icu4c
# icu4c is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides libicucore.dylib (but nothing else).

# If you need to have icu4c first in your PATH run:
#   echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
#   echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

# For compilers to find icu4c you may need to set:
#   export LDFLAGS="-L/usr/local/opt/icu4c/lib"
#   export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# For pkg-config to find icu4c you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"


# ==> tesseract
# This formula contains only the "eng", "osd", and "snum" language data files.
# If you need any other supported languages, run `brew install tesseract-lang`.


# ==> docbook
# To use the DocBook package in your XML toolchain,
# you need to add the following to your ~/.bashrc:

# export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"


# ==> gnu-getopt
# gnu-getopt is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have gnu-getopt first in your PATH run:
#   echo 'export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"' >> ~/.zshrc


# Bash completion has been installed to:
#   /usr/local/opt/gnu-getopt/etc/bash_completion.d

# ==> libtool
# In order to prevent conflicts with Apple's own libtool we have prepended a "g"
# so, you have instead: glibtool and glibtoolize.


# ==> gifify
# The Tcl/Tk GUIs (e.g. gitk, git-gui) are now in the `git-gui` formula.

# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh completions and functions have been installed to:
#   /usr/local/share/zsh/site-functions

# Emacs Lisp files have been installed to:
#   /usr/local/share/emacs/site-lisp/git


# ==> openjdk
# For the system Java wrappers to find this JDK, symlink it with
#   sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# openjdk is keg-only, which means it was not symlinked into /usr/local,
# because it shadows the macOS `java` wrapper.

# If you need to have openjdk first in your PATH run:
#   echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc

# For compilers to find openjdk you may need to set:
#   export CPPFLAGS="-I/usr/local/opt/openjdk/include"


# ==> heroku/brew/heroku
# To use the Heroku CLI's autocomplete --
#   Via homebrew's shell completion:
#     1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
#         NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
#               and called, either explicitly or via a framework like oh-my-zsh.
#     2) Then run
#       $ heroku autocomplete --refresh-cache

#   OR

#   Use our standalone setup:
#     1) Run and follow the install steps:
#       $ heroku autocomplete

# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh completions have been installed to:
#   /usr/local/share/zsh/site-functions


## ==> ncurses (zsh)

# ncurses is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have ncurses first in your PATH run:
#   echo 'export PATH="/usr/local/opt/ncurses/bin:$PATH"' >> ~/.zshrc

# For compilers to find ncurses you may need to set:
#   export LDFLAGS="-L/usr/local/opt/ncurses/lib"
#   export CPPFLAGS="-I/usr/local/opt/ncurses/include"

# For pkg-config to find ncurses you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"


# ==> fzf
# To install useful keybindings and fuzzy completion:
#   /usr/local/opt/fzf/install

# To use fzf in Vim, add the following line to your .vimrc:
#  set rtp+=/usr/local/opt/fzf


## ==> zsh-completions
# To activate these completions, add the following to your .zshrc:

#   if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#     autoload -Uz compinit
#     compinit
#   fi

# You may also need to force rebuild `zcompdump`:

#   rm -f ~/.zcompdump; compinit

# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:

#   chmod go-w '/usr/local/share'


## ==> zsh-syntax-highlighting
# To activate the syntax highlighting, add the following at the end of your .zshrc:
#   source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
#   export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters


# ==> gettext (git)
# gettext is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides the BSD gettext library & some software gets confused if both are in the library path.

# If you need to have gettext first in your PATH run:
#   echo 'export PATH="/usr/local/opt/gettext/bin:$PATH"' >> ~/.zshrc

# For compilers to find gettext you may need to set:
#   export LDFLAGS="-L/usr/local/opt/gettext/lib"
#   export CPPFLAGS="-I/usr/local/opt/gettext/include"


# ==> git
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh completions and functions have been installed to:
#   /usr/local/share/zsh/site-functions

# Emacs Lisp files have been installed to:
#   /usr/local/share/emacs/site-lisp/git


# ==> gnu-getopt (git-flow-avh)
# gnu-getopt is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have gnu-getopt first in your PATH run:
#   echo 'export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"' >> ~/.zshrc


# ==> git-flow-avh
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d

# zsh functions have been installed to:
#   /usr/local/share/zsh/site-functions


# ==> libtool (graphicsmagick)
# In order to prevent conflicts with Apple's own libtool we have prepended a "g"
# so, you have instead: glibtool and glibtoolize.


# ==> mas
# Bash completion has been installed to:
#   /usr/local/etc/bash_completion.d


# ==> ubiquiti-unifi-controller
# ubiquiti-unifi-controller requires Java 8. You can install it with:
#   brew cask install homebrew/cask-versions/adoptopenjdk8

# Installing ubiquiti-unifi-controller means you have AGREED to the license at:
#   https://www.ui.com/eula/


# => autojump
# Add the following line to your ~/.bash_profile or ~/.zshrc file (and remember
# to source the file to update your current session):
#   [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# If you use the Fish shell then add the following line to your ~/.config/fish/config.fish:
#   [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# zsh completions have been installed to:
#   /usr/local/share/zsh/site-functions


# ==> openssl
# A CA file has been bootstrapped using certificates from the system
# keychain. To add additional certificates, place .pem files in
#   /usr/local/etc/openssl@1.1/certs

# and run
#   /usr/local/opt/openssl@1.1/bin/c_rehash

# openssl@1.1 is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides LibreSSL.

# If you need to have openssl@1.1 first in your PATH run:
#   echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.profile

# For compilers to find openssl@1.1 you may need to set:
#   export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
#   export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
