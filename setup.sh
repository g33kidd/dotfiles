#!/usr/bin/env bash
#
# setup.sh
# This script will setup a brand-new OSX installation with THINGS.

xcode-select --install

# Install and setup homebrew
which -s brew
echo "Checking if homebrew exists..."
if [[ $? != 0 ]] ; then
	echo "There is no homebrew.. installing homebrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Updating homebrew..."
	brew update
fi

# Homebrew checks and Cask installation
echo "Installing homebrew things"
brew doctor
brew tap caskroom/cask

brew install node
brew install zsh
brew install composer
brew install emacs

brew cask install docker
brew cask install google-chrome
brew cask install slack
brew cask install spotify
brew cask install boom
brew cask install atom
brew cask install sublime

# Composer things
composer global require "squizlabs/php_codesniffer=*"
composer global require laravel/valet

# Create a developer folder and sites folder.
echo "Creating folders and files for Developer"
mkdir ~/Developer
mkdir ~/Sites

echo "I think I am done..."
exit