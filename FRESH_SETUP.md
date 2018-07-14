# Fresh Setup Notes

Notes for setting up a fresh Mac laptop

## OS Install

1. Create bootable USB disk with latest supported OSX (High Sierra at time of writing)
2. Fresh install.  Erase disk and install.

## Get access to logins

* Dropbox
	* Download/install from website
* Google Backup and Sync
	* Download/install from website
* 1Password
	* Install from appstore
	* Use family account, sync local vault via dropbox

## Command-line

* iTerm
	* option+left: Send Escape Sequence: b
	* option+right: Send Escape Sequence: f
	* option+delete: Send Hex Codes: 0x1b 0x7f
	* Unlimited scrollback (history)
* ssh-keys
	* see `scripts/setup_ssh.sh`
* backpack
	* `git clone git@github.com:abelnation/backpack.git`
	* brew install
		* fzf
		* diff-so-fancy
	* `./install.sh`
* Homebrew
	* see website for install
	* `brew update`
* oh-my-zsh
	* see github repo for install
	* plugins
		* fzf (TODO)
* python
	* `brew install pyenv pyenv-virtualenv`
* nvm
	* `mkdir ~/.nvm`
	* see github repo for install
* diff-so-fancy
	* `brew install diff-so-fancy`

## Other Software

* Chrome
* Moom
* Spotify
* Sublime
	* `./scripts/link_subl.sh`
	* `Install Package Control` from sublime commands
* VSCode
	* TODO

