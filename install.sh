#!/usr/bin/env bash

set -x # Debug

DOTFILES=~/.dotfiles

[[ ! -d ~/.dotfiles ]] && git clone https://github.com/hcartiaux/dotfiles.git $DOTFILES
[[ -d ~/.dotfiles ]] && ( cd $DOTFILES ; git pull )

cd ~

## zsh

mkdir -p ~/.zsh
cd ~/.zsh
[[ ! -d ~/.zsh/zsh-syntax-highlighting ]] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
[[ -d ~/.zsh/zsh-syntax-highlighting ]] && (cd ~/.zsh/zsh-syntax-highlighting ; git pull )
ln -sf $DOTFILES/zsh/prompt_hyacinthe_setup ~/.zsh/prompt_hyacinthe_setup
ln -sf $DOTFILES/zsh/zshrc ~/.zshrc

## bash

ln -sf $DOTFILES/bash/bashrc           ~/.bashrc
ln -sf $DOTFILES/bash/inputrc          ~/.inputrc
ln -sf $DOTFILES/bash/bash_profile     ~/.bash_profile
ln -sf $DOTFILES/bash/profile          ~/.profile
ln -sf $DOTFILES/bash/bash_logout      ~/.bash_logout
ln -sf $DOTFILES/bash/bash_environment ~/.bash_environment
ln -sf $DOTFILES/bash/bash_oar         ~/.bash_oar
ln -sf $DOTFILES/bash/bash_aliases     ~/.bash_aliases

if [[ ! -f ~/.git-prompt.sh ]] ; then
    curl -o ~/.git-prompt.sh \
         https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
fi

## vim (don't forget :BundleInstall & :BundleInstall!)

mkdir -p ~/.vim
cd ~/.vim
mkdir -p backup undo swap spell bundle
[[ ! -d bundle/vundle ]] && git clone https://github.com/gmarik/vundle.git bundle/vundle
[[ -d bundle/vundle ]] && ( cd bundle/vundle ; git pull )

ln -sf $DOTFILES/vim/vimrc ~/.vimrc
[[ ! -h ~/.vim/header ]] && ln -sf $DOTFILES/vim/header ~/.vim/header

[[ -e ~/.viminfo ]] && mv ~/.viminfo ~/.vim/

## tmux

ln -sf $DOTFILES/tmux/tmux.conf ~/.tmux.conf

## screen

ln -sf $DOTFILES/screen/screenrc ~/.screenrc

## rtorrent

ln -sf $DOTFILES/rtorrent/rtorrent.rc ~/.rtorrent.rc
mkdir -p ~/.rtorrent

## git

ln -sf $DOTFILES/git/gitconfig ~/.gitconfig

## ssh

mkdir -p ~/.ssh/sockets
ln -sf $DOTFILES/ssh/sshpubkey ~/.ssh/sshpubkey
cat $DOTFILES/ssh/config.* > ~/.ssh/config.perso
[[ ! -f ~/.ssh/config ]] && cat $DOTFILES/ssh/config{,.*} > ~/.ssh/config

## aurvote

[[ -f /etc/arch-release ]] && (
    mkdir -p ~/.config
    cp -f $DOTFILES/aurvote ~/.config/aurvote
)

## RVM configuration

ln -sf $DOTFILES/rvm/rvmrc ~/.rvmrc

## temporary files

ln -sf /tmp ~/.adobe
ln -sf /tmp ~/.cache
ln -sf /tmp ~/.macromedia
ln -sf /tmp ~/.thumbnails

