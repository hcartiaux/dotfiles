#!/usr/bin/env bash

# set -x # Debug

MAIL_PERSO='hyacinthe.cartiaux@free.fr'
MAIL_PRO='hyacinthe.cartiaux@uni.lu'
PLAN='World domination!'
DOTFILES=~/.dotfiles
MYLAPTOP=hc-promax14

HOST=$(hostname -s)

echo $PLAN > ~/.plan

[[ ! -d ~/.dotfiles ]] && git clone https://github.com/hcartiaux/dotfiles.git $DOTFILES
[[   -d ~/.dotfiles ]] && ( cd $DOTFILES ; git pull )

cd ~

## zsh

ln -sf $DOTFILES/zsh/zshrc             ~/.zshrc

## bash

ln -sf $DOTFILES/bash/bashrc           ~/.bashrc
ln -sf $DOTFILES/bash/inputrc          ~/.inputrc
ln -sf $DOTFILES/bash/bash_profile     ~/.bash_profile
ln -sf $DOTFILES/bash/profile          ~/.profile
ln -sf $DOTFILES/bash/bash_logout      ~/.bash_logout
ln -sf $DOTFILES/bash/bash_environment ~/.bash_environment
ln -sf $DOTFILES/bash/bash_oar         ~/.bash_oar
ln -sf $DOTFILES/bash/bash_slurm       ~/.bash_slurm
ln -sf $DOTFILES/bash/bash_aliases     ~/.bash_aliases

# ksh

ln -sf $DOTFILES/ksh/kshrc             ~/.kshrc

## vim

mkdir -p ~/.vim
cd       ~/.vim
mkdir -p backup undo swap spell

ln -sf $DOTFILES/vim/vimrc ~/.vimrc
[[ ! -h ~/.vim/header ]] && ln -sf $DOTFILES/vim/header ~/.vim/header

[[   -e ~/.viminfo ]]    && mv ~/.viminfo ~/.vim/

## tmux

ln -sf $DOTFILES/tmux/tmux.conf        ~/.tmux.conf

## screen

ln -sf $DOTFILES/screen/screenrc       ~/.screenrc

## rtorrent

ln -sf $DOTFILES/rtorrent/rtorrent.rc  ~/.rtorrent.rc
mkdir -p ~/.rtorrent

## git

ln -sf $DOTFILES/git/gitconfig         ~/.gitconfig

## ssh

mkdir -p  ~/.ssh/sockets
ln  -sf $DOTFILES/ssh/sshpubkey        ~/.ssh/sshpubkey
[[ ! -e ~/.ssh/config ]] && (
  ln -s $DOTFILES/ssh/config           ~/.ssh/
)
ln -s $DOTFILES/ssh/config.home        ~/.ssh/

## wget

ln -sf $DOTFILES/wget/wgetrc           ~/.wgetrc

# GnuPG

mkdir -p                               ~/.gnupg
ln -sf $DOTFILES/gnupg/gpg.conf        ~/.gnupg/gpg.conf
ln -sf $DOTFILES/gnupg/gpg-agent.conf  ~/.gnupg/gpg-agent.conf


[[ "$HOST" = "$MYLAPTOP" ]] && (

  if [[ $USER == "hcartiaux" ]] ; then
    echo $MAIL_PRO > ~/.forward
    ln -sf $DOTFILES/git/gitconfig-work     ~/.gitconfig-user

    ## RVM configuration
    ln -sf $DOTFILES/rvm/rvmrc  ~/.rvmrc
  else
    echo $MAIL_PERSO > ~/.forward
    ln -sf $DOTFILES/git/gitconfig-personal ~/.gitconfig-user
  fi

  # neovim
  ln -sf $DOTFILES/nvim  ~/.config/

  ## temporary files
  ln -sf /tmp ~/.cache

) || true

