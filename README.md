# Dot files for FE developers @ Unic

Stolen from all around the web :) Thanks Internet! ❤️

This will:

- Set and create some folders
- Setup ad-blocking hosts (if you want)
- Setup Github for your account
- Install Homebrew
- Install software via [Homebrew bundle](./Brewfile)
- Set Z-Shell as the default user login shell
- Use [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) shell framework
- Set [`powerlevel10k`](https://github.com/romkatv/powerlevel10k) theme (but you can pick yours from https://github.com/robbyrussell/oh-my-zsh/wiki/Themes)
- Install PowerLine fonts to be able to have icons in the terminal prompt
- Install useful key bindings and fuzzy completion
- Alias user's home dotfiles to the ones in this repo
- Setup VIM and set it as default terminal editor
- Install NVM from the source
- Install current `lts` node version as the default node
- Configure node to always install dependencies in exact versions
- Adjust the system (if accepted) in 2 levels:
  - the [general adjustments](./lib_sh/system_adjustments_general.sh)
  - the [opinionated adjustments](`./lib_sh/system_adjustments_opinionated.sh`)

## Proceeding

### Preparation

Fork this repo, then clone it and do the following:

- Configure your installation variables in [`./configs/installation.sh`](./configs/installation.sh)
- Configure your ZSH variables in [`./lib_zsh/frontend.zsh`](./lib_zsh/frontend.zsh) (Config vars section)
- Configure your system adjustments in [`lib_sh/system_adjustments_opinionated.sh`](lib_sh/system_adjustments_opinionated.sh)
- Go through [`./install.sh`](./install.sh) and [`./lib_sh/system_adjustments_general.sh`](./lib_sh/system_adjustments_general.sh) and adapt it in case you don't like something
- Adapt the software you use with the [`./Brewfile`](./Brewfile)
- Add this repo as an upstream (to get the updates from this repo) and use your fork from now on for your installs

You can also clone your forked repo in your "old" machine, then in the folder where this was cloned run the following in order to get the last state of your installed apps:

```bash
brew bundle dump --describe --force
```

This 👆will update the `Brewfile` with your current installed apps (if installed using Brew). Notice that this also requires you to have Homebrew and MAS installed (which you eventually already have if you also run this in your old machine, back in the day you got it 😉).

#### Git

- Check if `git` is already available in your system to be able to clone the repo: `git -v`
- If you see the error `xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun ` then you need to install Ddeveloper Tools
- Install developer tools by executing: `xcode-select --install`

#### Disclaimer

> You should always review arbitrary code from the internet before running it on your machine with sudo power!
> You are responsible for everything this script does to your machine (see LICENSE)

### Installation

Run this 👇 on your new machine's terminal app and follow the instructions there.

> DON'T FORGET TO SWAP THIS REPO BY YOUR FORKED ONE INSTEAD!

```bash
git clone --recurse-submodules https://git.unic.com/scm/~oriol.torrent/frontend-dotfiles-oriol.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh
```

When it finishes reboot the system when the prompt requires so. After the reboot you may see a message like the following in the terminal:

If you see this message 👇 type `y` and hit `enter`. If not ignore this and go on.

```bash
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```

> Note: running install.sh is idempotent. You can run it again and again as you add new features or software to the scripts!

Finally, configure your PowerLevel10 prompt with:

```bash
p10k configure
```

### Finalization

When it finishes, open Terminal (or iTerm) and:

1. press `Command + ,` to open preferences.
1. Under Profiles > Colors, select "Load Presets" and choose the theme scheme defined in `instal.sh`. If it isn't there for some reason, import it from `~/.dotfiles/configs`
1. Eventually you may also need to select the `Hack` font and check the box for non-ascii font and set to `Roboto Mono For Powerline` or any other Powerline font (I've had mixed results for automating these settings -- I'd love a pull request that improves this)

---

## Restoring Dot files

If you have existing dot files for configuring git, zsh, vim, etc, these will be backed-up into `~/.dotfiles_backup/$(date +"%Y.%m.%d.%H.%M.%S")` and replaced with the files from this project. You can restore your original dot files by using `./restore.sh $RESTOREDATE` where `$RESTOREDATE` is the date folder name you want to restore.

> The restore script does not currently restore system settings--only your original dot files. To restore system settings, you'll need to manually undo what you don't like (so don't forget to fork, review, tweak)

---

## Settings

This project changes a number of settings and configures software on MacOS.

## License

This project is licensed under ISC. Please fork, contribute and share.

## Contributions

Contributions are always welcome! Open pull requests with explanatory comments.

## ¯\\_(ツ)_/¯ Warning / Liability

Neither Unic nor the creator(s) are responsible if your machine ends up in a state you are not happy with. If you are concerned, look at the code to review everything this will do to your machine :)
