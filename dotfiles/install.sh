#!/bin/bash
mv $HOME/.vimrc $HOME/.vimrc.old
mv $HOME/.gitconfig $HOME/.gitconfig.old
rm $HOME/.vim.old
mv $HOME/.vim $HOME/.vim.old

ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/vim $HOME/.vim

