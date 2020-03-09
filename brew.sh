#!/usr/bin/env bash

# Checks that Homebrew is installed and install if not
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

### Install Brew Packages
brew install python
brew install ruby
brew install tree
brew install git

### Install MacOS Applications
# Browsers
brew cask install google-chrome
brew cask install firefox
# Extra
brew cask install spotify
brew cask install skype
brew cask install vlc
brew cask install teamviewer
# Misc
brew cask install appcleaner
brew cask install caffeine
brew cask install flux
brew cask install day-o
brew cask install daisydisk
brew cask install slack
brew cask install discord

# Youtube downloader and dependancie
brew install ffmpeg
brew install youtube-dl
brew install imagemagick

# Code Editors + ftp manager
brew cask install visual-studio-code
brew cask install cyberduck
## Code editor extras
brew install unrar # Unpack all .zip rar files
brew install pandoc # Pandoc install for vscode 
brew cask install basictex # Pandoc util to generate pdf

### Install Source Code Pro Font
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

# Remove brew cruft
brew cleanup