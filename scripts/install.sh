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
mv $HOME/.muttrc $HOME/.muttrc.old
mv $HOME/.urlview $HOME/.urlview.old
mv $HOME/.mailcap $HOME/.mailcap.old

# link
cd dotfiles
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/vim $HOME/.vim
ln -s $PWD/screenrc $HOME/.screenrc
ln -s $PWD/bashrc $HOME/.bashrc
ln -s $PWD/bash_aliases $HOME/.bash_aliases
ln -s $PWD/muttrc $HOME/.muttrc
ln -s $PWD/urlview $HOME/.urlview
ln -s $PWD/mailcap $HOME/.mailcap

# create git ignore for known vim submodules
echo .gitignore > vim/bundle/fuzzyfinder/.gitignore
echo "tags*" >> vim/bundle/fuzzyfinder/.gitignore

echo .gitignore > vim/bundle/l9/.gitignore
echo "tags*" >> vim/bundle/l9/.gitignore

#checkout master for all submodules and pathogen
scripts_dir=$PWD
s_mods=$(find $scripts_dir/../dotfiles/vim/bundle/ -maxdepth 1 -type d|tail -n +2)
for s_mod in $s_mods; do
	cd $s_mod
	git co master
done

cd $scripts_dir/../dotfiles/vim/pathogen
git co master

cd $scripts_dir/..
git submodule foreach git pull
