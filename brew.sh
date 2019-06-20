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
brew install tree

### Install MacOS Applications
# Browsers
brew cask install google-chrome
brew cask install firefox
# Extra
brew cask install virtualbox
brew cask install spotify
brew cask install skype
brew cask install gimp
brew cask install vlc
brew cask install mvp
brew cask install teamviewer
# Misc
brew cask install appcleaner
brew cask install caffeine
brew cask install flux
brew cask install day-o
brew cask install daisydisk
brew install speedtest-cli # Commandline Speedtest
brew install unrar # Unpack all .zip rar files
brew install pandoc # Pandoc install for vscode 
brew cask install basictex # Pandoc util to generate pdf

# Youtube downloader and dependancie
brew install ffmpeg
brew install youtube-dl

# Code Editors + ftp manager
brew cask install visual-studio-code
brew cask install sublime-text
brew cask install arduino # For Escaperoom Projects
brew cask install cyberduck
# Microsoft office
brew cask install microsoft-office

### Install Source Code Pro Font
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup
