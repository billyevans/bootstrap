#!/bin/bash

DIR=`pwd`

# dotfiles
for f in vim vimrc profile bashrc gitconfig inputrc pylintrc tmux.conf
do
	ln -s $DIR/$f ~/.$f
done


if [ `uname` == "Darwin" ]
then
	# sublime
	mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
	for f in Preferences.sublime-settings CPP.sublime-build
	do
		ln -s $DIR/$f ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/$f
	done
	# iterm
	mkdir -p ~/Library/Preferences
	ln -s $DIR/iterm/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

fi


mkdir -p ~/.ssh/
ln -s $DIR/ssh/config ~/.ssh/config
ln -s $DIR/ssh/rc ~/.ssh/rc


