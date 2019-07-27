# !/bin/bash

# New project folder Python
function createPy() {
    cd
    python3 /Users/Remco/dotfiles/function_scripts/new_project_py.py $1
    cd /Users/Remco/Sites/dev/Python_projects/$1
    python3 -m venv venv
    . venv/bin/activate
    git init
    touch .gitignore
    touch README.md
    touch TODO.md
    touch main.py
    code .
    echo 'New python Project has been created' $1
}

# New project folder sets venv and installs > FBS, PyQt5
function createQt() {
    cd
    python3 /Users/Remco/dotfiles/function_scripts/new_project_qt.py $1
    cd /Users/Remco/Sites/dev/PyQT_projects/$1
    python3 -m venv venv
    . venv/bin/activate
    git init
    touch .gitignore
    touch README.md
    touch TODO.md
    pip install fbs PyQt5 
    fbs startproject
    code .
    echo 'New fbs(gui) Project has been created' $1
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Finding app full path to use for CLI
function findApp() {
    NAME_APP=$1
    PATH_LAUNCHSERVICES="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
    ${PATH_LAUNCHSERVICES} -dump | grep -o "/.*${NAME_APP}.app" | grep -v -E "Caches|TimeMachine|Temporary|/Volumes/${NAME_APP}" | uniq
}

function addFlutter() {
    cd
    flutter create ~/Sites/dev/flutter_projects/$1
    cd ~/Sites/dev/flutter_projects/$1
    code .
    open -a '/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
    exit
}