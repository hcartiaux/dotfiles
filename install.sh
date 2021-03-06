#!/usr/bin/env bash

# set -x # Debug

MAIL='hyacinthe.cartiaux@free.fr'
PLAN='World domination!'
DOTFILES=~/.dotfiles
MYLAPTOP=hc-xps15

HOST=$(hostname -s)

echo $MAIL > ~/.forward
echo $PLAN > ~/.plan

[[ ! -d ~/.dotfiles ]] && git clone https://github.com/hcartiaux/dotfiles.git $DOTFILES
[[   -d ~/.dotfiles ]] && ( cd $DOTFILES ; git pull )

cd ~

## zsh

mkdir -p ~/.zsh
cd       ~/.zsh
[[ ! -d  ~/.zsh/zsh-syntax-highlighting ]] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
[[   -d  ~/.zsh/zsh-syntax-highlighting ]] && (cd ~/.zsh/zsh-syntax-highlighting ; git pull )
ln -sf $DOTFILES/zsh/prompt_hyacinthe_setup ~/.zsh/prompt_hyacinthe_setup
ln -sf $DOTFILES/zsh/zshrc                  ~/.zshrc

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

if [[ ! -f ~/.git-prompt.sh ]] ; then
    curl -o ~/.git-prompt.sh \
      https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

## vim

mkdir -p ~/.vim
cd       ~/.vim
mkdir -p backup undo swap spell

ln -sf $DOTFILES/vim/vimrc ~/.vimrc
[[ ! -h ~/.vim/header ]] && ln -sf $DOTFILES/vim/header ~/.vim/header

[[   -e ~/.viminfo ]]    && mv ~/.viminfo ~/.vim/

## tmux

ln -sf $DOTFILES/tmux/tmux.conf       ~/.tmux.conf

## screen

ln -sf $DOTFILES/screen/screenrc      ~/.screenrc

## rtorrent

ln -sf $DOTFILES/rtorrent/rtorrent.rc ~/.rtorrent.rc
mkdir -p ~/.rtorrent

## git

ln -sf $DOTFILES/git/gitconfig          ~/.gitconfig
ln -sf $DOTFILES/git/gitconfig-work     ~/.gitconfig-work
ln -sf $DOTFILES/git/gitconfig-personal ~/.gitconfig-personal

## ssh

mkdir -p  ~/.ssh/sockets
ln  -sf $DOTFILES/ssh/sshpubkey       ~/.ssh/sshpubkey
cat     $DOTFILES/ssh/config.*      > ~/.ssh/config.perso
cat     $DOTFILES/ssh/config{,.g5k} > ~/.ssh/config_g5k
[[ ! -f ~/.ssh/config ]] && (
    cat $DOTFILES/ssh/config{,.*}   > ~/.ssh/config
)

## wget

if [[ "$(hostname -f | cut -d '.' -f 3)" = "grid5000" ]] ; then
    ln -sf $DOTFILES/wget/wgetrc.g5k ~/.wgetrc
else
    ln -sf $DOTFILES/wget/wgetrc     ~/.wgetrc
fi

# GnuPG

mkdir -p                               ~/.gnupg
ln -sf $DOTFILES/gnupg/gpg.conf        ~/.gnupg/gpg.conf
ln -sf $DOTFILES/gnupg/gpg-agent.conf  ~/.gnupg/gpg-agent.conf


[[ "$HOST" = "$MYLAPTOP" ]] && (

    ## direnv / pyenv configuration

    mkdir -p ~/.config/direnv/
    ln -sf $DOTFILES/direnv/direnvrc ~/.config/direnv/direnvrc
    ln -sf $DOTFILES/direnv/envrc    ~/.config/direnv/envrc
    ln -sf $DOTFILES/direnv/init.sh  ~/.config/direnv/init.sh
    mkdir -p ~/.config/pyenv/
    ln -sf $DOTFILES/pyenv/init.sh  ~/.config/pyenv/init.sh

    ## RVM configuration

    ln -sf $DOTFILES/rvm/rvmrc  ~/.rvmrc

    ## G5K

    echo "ssh_config_files: '~/.ssh/config_g5k'" > ~/.net-admin.yaml
    touch ~/.password-store

    if [[ ! -d ~/.restfully ]]; then
        mkdir ~/.restfully
        cp $DOTFILES/g5k/restfully/api.grid5000.fr.yml ~/.restfully
        ln -sf ~/.restfully/api.grid5000.fr.yml ~/.restfully/api.grid5000.fr.yaml
    fi

    ## temporary files

    ln -sf /tmp ~/.adobe
    ln -sf /tmp ~/.cache
    ln -sf /tmp ~/.macromedia
    ln -sf /tmp ~/.thumbnails

)

[[ "$WORK" != "" ]] && (
    mkdir -p $WORK/.local
    ln -sf $WORK/.local ~/.local
)

