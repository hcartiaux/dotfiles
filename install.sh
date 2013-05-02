#!/bin/bash

set -x # Debug

$DOTFILES=~/.dotfiles
$BACKUP=~/.dotfiles_backup

[[ ! -d ~/.dotfiles ]] && git clone https://github.com/hcartiaux/dotfiles.git $DOTFILES
[[ -d ~/.dotfiles ]] && ( cd $DOTFILES ; git pull )

mkdir -p $BACKUP

cd ~

## zsh

mkdir ~/.zsh
cd ~/.zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
ln -sf $DOTFILES/zsh/prompt_hyacinthe_setup ~/.zsh/prompt_hyacinthe_setup
ln -sf $DOTFILES/zsh/zshrc ~/.zshrc

## bash

mv ~/.bashrc ~/.inputrc ~/.bash_profile ~/.profile ~/.bash_logout $BACKUP

ln -sf $DOTFILES/bash/bashrc       ~/.bashrc
ln -sf $DOTFILES/bash/inputrc      ~/.inputrc
ln -sf $DOTFILES/bash/bash_profile ~/.bash_profile
ln -sf $DOTFILES/bash/profile      ~/.profile
ln -sf $DOTFILES/bash/bash_logout  ~/.bash_logout

## vim (don't forget :BundleInstall & :BundleInstall!)

mkdir -p ~/.vim
cd ~/.vim
mkdir -p backup spell bundle
[[ ! -d bundle/vundle ]] && git clone https://github.com/gmarik/vundle.git bundle/vundle
[[ -d bundle/vundle ]] && ( cd bundle/vundle ; git pull )

ln -sf $DOTFILES/vim/vimrc ~/.vimrc
ln -sf $DOTFILES/vim/header ~/.vimrc/header

## tmux

ln -sf $DOTFILES/tmux/tmux.conf ~/.tmux.conf

## screen

ln -sf $DOTFILES/screen/screenrc ~/.screenrc

## git

ln -sf $DOTFILES/git/gitconfig ~/.gitconfig

## ssh

mkdir -p ~/.ssh/sockets
ln -s $DOTFILES/ssh/sshpubkey ~/.ssh/sshpubkey
[! -f ~/.ssh/config ] ln -s $DOTFILES/ssh/config ~/.ssh/config

