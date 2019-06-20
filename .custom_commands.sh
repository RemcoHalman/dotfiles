# !/bin/bash

# New project folder Python
function createPy() {
    cd
    python3 /Users/Remco/dotfiles/custom_commands_scripts/new_project_py.py $1
    cd /Users/Remco/Sites/dev/PythonProjects/$1
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
    python3 /Users/Remco/dotfiles/custom_commands_scripts/new_project_qt.py $1
    cd /Users/Remco/Sites/dev/PyQTApps/$1
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