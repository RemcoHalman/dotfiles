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
# Browsers
brew cask install google-chrome
brew cask install firefox
# Misc
brew cask install virtualbox
brew cask install sourcetree
brew cask install spotify
brew cask install skype
brew cask install gimp
brew cask install vlc
brew cask install mvp
brew cask install caffeine
brew cask install teamviewer
brew cask install flux
# Code Editors
brew cask install visual-studio-code
brew cask install sublime-text

### Install Source Code Pro Font
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup
