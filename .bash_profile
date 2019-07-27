# Load dotfiles:
for file in ~/.{bash_prompt,aliases,private,environments_vars}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#Git auto-complete
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# Load custom commands if available
if [ -f ~/.functions.sh ]; then
    source ~/.functions.sh
fi

# Setting PATH for Python 3.7
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

# Setting PATH for Flutter SDK
export PATH="$PATH:/Users/Remco/Sites/flutter/bin"

# Setting PATH for Visual Studio Code (CLI usage)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
