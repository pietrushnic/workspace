#!/bin/bash

cd ..
git submodule init
git submodule update

# backup
mv $HOME/.vimrc $HOME/.vimrc.old
mv $HOME/.gitconfig $HOME/.gitconfig.old
rm -rf $HOME/.vim.old
mv $HOME/.vim $HOME/.vim.old
mv $HOME/.bashrc $HOME/.bashrc.old
mv $HOME/.bash_aliases $HOME/.bash_aliases.old
mv $HOME/.muttrc $HOME/.muttrc.old
mv $HOME/.urlview $HOME/.urlview.old
mv $HOME/.mailcap $HOME/.mailcap.old
mv $HOME/.pythonrc $HOME/.pythonrc.old
mv $HOME/.tmux.conf $HOME/.tmux.conf.old
mv $HOME/.tmuxinator $HOME/.tmuxinator.old
rm -rf $HOME/.task.old
mv $HOME/.task $HOME/.task.old
mv $HOME/.taskrc $HOME/.taskrc.old
mv $HOME/.bash_profile $HOME/.bash_profile.old
rm -rf $HOME/.mutt.old
mv $HOME/.mutt $HOME/.mutt.old
mv $HOME/.offlineimaprc $HOME/.offlineimaprc.old
rm -rf $HOME/.weechat.old
mv $HOME/.weechat $HOME/.weechat.old

# link
cd dotfiles
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/vim $HOME/.vim
ln -s $PWD/bashrc $HOME/.bashrc
ln -s $PWD/bash_aliases $HOME/.bash_aliases
ln -s $PWD/muttrc $HOME/.muttrc
ln -s $PWD/urlview $HOME/.urlview
ln -s $PWD/mailcap $HOME/.mailcap
ln -s $PWD/pythonrc $HOME/.pythonrc
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/tmuxinator $HOME/.tmuxinator
ln -s $PWD/taskwarrior/task $HOME/.task
ln -s $PWD/taskwarrior/taskrc $HOME/.taskrc
ln -s $PWD/bash_profile $HOME/.bash_profile
ln -s $PWD/mutt $HOME/.mutt
ln -s $PWD/mutt/offlineimaprc $HOME/.offlineimaprc
ln -s $PWD/weechat $HOME/.weechat


# create git ignore for known vim submodules
echo .gitignore > vim/bundle/fuzzyfinder/.gitignore
echo "tags*" >> vim/bundle/fuzzyfinder/.gitignore

echo .gitignore > vim/bundle/l9/.gitignore
echo "tags*" >> vim/bundle/l9/.gitignore

echo .gitignore > vim/bundle/cvim/.gitignore
echo "tags*" >> vim/bundle/cvim/.gitignore

echo .gitignore > vim/bundle/taglist/.gitignore
echo "tags*" >> vim/bundle/taglist/.gitignore

#checkout master for all submodules and pathogen
scripts_dir=$PWD
s_mods=$(find $scripts_dir/../dotfiles/vim/bundle/ -maxdepth 1 -type d|tail -n +2)
for s_mod in $s_mods; do
	cd $s_mod
	git co master
done

cd $scripts_dir/../dotfiles/vim/pathogen
git co master
cd $scripts_dir/../dotfiles/taskwarrior
git co master
cd $scripts_dir/..
git submodule foreach git pull

s_mods=$(cat .gitmodules |grep "path ="|cut -d" " -f 3)
for s_mod in $s_mods; do
	git submodule update $s_mod
done
