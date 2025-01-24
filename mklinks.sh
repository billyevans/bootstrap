#!/bin/bash

DIR=`pwd`

# dotfiles
for f in vim vimrc profile bashrc gitconfig inputrc pylintrc tmux.conf zshrc
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
mkdir -p ~/.config/fish
mkdir -p ~/.config/zed/themes
mkdir -p ~/.oh-my-zsh/themes

ln -s $DIR/ssh/config ~/.ssh/config
ln -s $DIR/ssh/rc ~/.ssh/rc
ln -s $DIR/config/fish/config.fish ~/.config/fish
ln -s $DIR/config/zed/settings.json ~/.config/zed
ln -s $DIR/config/zed/themes/* ~/.config/zed/themes
ln -s $DIR/oh-my-zsh/themes/billyevans.zsh-theme ~/.oh-my-zsh/themes/billyevans.zsh-theme
