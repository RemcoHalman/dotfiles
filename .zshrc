export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

autoload -U colors && colors
autoload -Uz compinit && compinit

zstyle ':completion:*:*:git:*' script ~/dotfiles/git-completion.bash
fpath=(~/.zsh $fpath)

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

if [ -f ~/dotfiles/.shell_profile ]; then
    . ~/dotfiles/.shell_profile
fi

if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
fi

if [ -f ~/dotfiles/.private ]; then
    . ~/dotfiles/.private
fi

if [ -f ~/dotfiles/.environments_vars ]; then
    . ~/dotfiles/.environments_vars
fi

if [ -f ~/dotfiles/.functions.sh ]; then
    . ~/dotfiles/.functions.sh
fi


# Setting PATH for Visual Studio Code (CLI usage)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/remco/.asdf/installs/flutter/2.0.6-stable/bin"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
