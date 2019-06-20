#!/usr/bin/env bash

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

### Install Brew Packages
brew install python
brew install tree

### Install MacOS Applications
brew cask install google-chrome
brew cask install appcleaner
brew cask install caffeine
brew cask install flux
brew cask install day-o
brew install unrar # Unpack all .zip rar files

# Code Editors
brew cask install visual-studio-code
brew cask install cyberduck
# Code editor ext.
brew install pandoc # Pandoc install for vscode 
brew cask install basictex # Pandoc util to generate pdf


### Install Source Code Pro Font
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

# Remove brew cruft
brew cleanup
