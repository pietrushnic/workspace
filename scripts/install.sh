#!/bin/bash

cd ..;git submodule init
git submodule update

# backup
mv $HOME/.vimrc $HOME/.vimrc.old
mv $HOME/.gitconfig $HOME/.gitconfig.old
rm -rf $HOME/.vim.old
mv $HOME/.vim $HOME/.vim.old
mv $HOME/.screenrc $HOME/.screenrc.old
mv $HOME/.bashrc $HOME/.bashrc.old
mv $HOME/.bash_aliases $HOME/.bash_aliases.old

ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/vim $HOME/.vim
ln -s $PWD/screenrc $HOME/.screenrc
ln -s $PWD/bashrc $HOME/.bashrc
ln -s $PWD/bash_aliases $HOME/.bash_aliases

