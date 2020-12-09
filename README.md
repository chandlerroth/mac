# Mac

## Install

First, make sure you are logged in to iCloud and the App Store. Then run:

`git clone git@github.com:chandlerroth/mac.git; mv mac/*(D) ~; rm -rf mac; ~/.bundle.sh`

For subsequent installs or updates, run `mac` anywhere.

## Configure

### Oh My Zsh

- Run `git config oh-my-zsh.hide-status 1` to turn off Oh My Zsh git-prompt for the home directory

### aws

- Run `aws configure` to setup AWS

### gh

- Run `gh auth login`

### rbenv

- Visit https://www.ruby-lang.org/ to find the LTS version
- Run `rbenv install [lts]`
- Run `rbenv global [lts]`

### pyenv

- Visit https://www.python.org/ to find the LTS version
- Run `pyenv install [lts]`
- Run `pyenv global [lts]`

### nodenv

- Visit https://nodejs.org/ to find the LTS version
- Run `nodenv install [lts]`
- Run `nodenv global [lts]`

### 