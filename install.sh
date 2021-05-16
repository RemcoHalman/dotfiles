#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And sets a few working folders
# And also installs Homebrew Packages
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

#### Creating personal folder structure
# On Desktop
cd ${homedir}/Desktop
mkdir Screenshots_test

# In home folder
directorys="csv logs Code Work"
for directory in ${directorys}; do
    echo "Creating $directory in home directory."
    mkdir ${homedir}/${directory}
done

codedir=${homedir}/Code
codeFolders="dev production sdk"
for codeFolder in ${codeFolders}; do
    echo "Creating working folder $siteFolder in Code directory."
    mkdir ${Codedir}/${codeFolder}
done

echo "Code working folders created"

workFolders="Python Django Flask PyQt Arduino C# cpp Wordpress Website Personal"
for workFolder in ${workFolders}; do
    echo "Creating working folder $workFolder in dev directory."
    mkdir ${sitesdir}/dev/${workFolder}_projects
done

echo "dev folders created"

# dotfiles directory
dotfiledir=${homedir}/dotfiles

# list of files/folders to symlink in ${homedir}
files="shell_profile aliases private environments_vars functions.sh macos gitconfig"

# change to the dotfiles directory and adding custom commands folder
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# Create empty Private files so the symlink wont Fail
touch .profile
touch .private
touch .environments_vars


# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download Git Auto-Completion
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${homedir}/.git-completion.bash

# Run MacOS preference installation
./.macos

# Run the Homebrew Script For a full os setup
./brew.sh