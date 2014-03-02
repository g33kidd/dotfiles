#!/bin/bash
################################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
################################

############### Variables

dir 	= ~/dotfiles	#dotfiles directory
old_dir = ~/dotfiles_old
files 	= "bash_prompt"

################

# create dotfiles_old in homedir
echo "Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
echo "done"

# change to dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the dotfiles directory.
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $old_dir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done