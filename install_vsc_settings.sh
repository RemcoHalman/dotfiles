#!/bin/bash

which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Code not installed or not added to Path"
    echo "Exiting..." && exit 1
fi

echo "Visual studio Code preference setup has started"

# Overwriting the existing files that may or may not exist
cat ~/dotfiles/settings/settings.json > $HOME/Library/Application\ Support/Code/User/settings.json
cat ~/dotfiles/settings/keybindings.json > $HOME/Library/Application\ Support/Code/User/keybindings.json
cp -a ~/dotfiles/settings/snippets/* $HOME/Library/Application\ Support/Code/User/snippets/

# Install extensions
filename='settings/vs_extensions.txt'
filelines=`cat $filename`
echo Start
for line in $filelines ; do
    code --install-extension $line --force
done

echo "All Done! Extensions are installed, and preference set."