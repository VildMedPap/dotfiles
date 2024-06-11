# My dotfiles

## Prerequisites

* `GNU stow`
  * MacOS: `brew install stow`
  * Ubuntu: `sudo apt-get update && sudo apt-get install -y stow`

## Usage

### Setup all dotfiles

Run `cd stow && stow -vSt ~ *`.

### Add new package to stow

Say you wanted to add your `.vimrc` file to stow:
* Create the directory `stow/vim`: `mkdir -p stow/vim`
* Touch `.vimrc` file: `touch stow/vim/.vimrc`
* Adopt "real" `.vimrc` file: `stow -vSt ~ vim --adopt`

