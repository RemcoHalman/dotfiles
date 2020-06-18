# !/bin/bash

# New project folder Python
function createPy() {
    cd
    python3 ~/dotfiles/function_scripts/new_project_py.py $1
    cd ~/Sites/dev/Python_projects/$1
    python3 -m venv venv
    . venv/bin/activate
    git init
    touch .gitignore README.md TODO.md main.py
    code .
    echo 'New python Project has been created' $1
}

# New project folder sets venv and installs > FBS, PyQt5
function createQt() {
    cd
    python3 ~/dotfiles/function_scripts/new_project_qt.py $1
    cd ~/Sites/dev/PyQT_projects/$1
    virtualenv -p python3.6 venv
    . venv/bin/activate
    git init
    touch .gitignore README.md=
    pip install fbs PyQt5==5.9.2
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

function addPersonal() {
    if [ -z "$1" ]; then
        echo -e "\nNo name specified, Try Again \nUsage: addPersonal <NameOfFolder> <Optional: repo>"
    else
        cd && cd ~/Sites/dev/Personal_projects
        mkdir $1 $1/src && cd $1
        python3 -m venv venv
        . venv/bin/activate
        cd $1
        git init .
        touch README.md TODO.md .env .env-template
        cp /Users/remco/dotfiles/base_files/gitignore_base.txt .gitignore
        cp /Users/remco/dotfiles/base_files/main.py src/main.py
        pip install python-dotenv secure
        code .
    fi
    
    if [ -z "$2"]; then
        echo "No repo has been made."
    else
        echo "repo, setup not done"
    fi
}

function addKivy() {
    if [ -z "$1" ]; then
        echo -e "\nNo name specified, Try Again \nUsage: addKivy <NameOfFolder>\n"
    else
        cd && cd ~/Sites/dev/Kivy_projects
        mkdir $1 $1/src && cd $1
        python3 -m venv venv
        . venv/bin/activate
        cd $1
        git init .
        cp /Users/remco/dotfiles/base_files/gitignore_base.txt .gitignore
        touch README.md TODO.md .env .env-template
        pip install kivy pyinstaller Cython==0.29.10 python-dotenv
        code .
    fi
}

function addNotePrivate() {
    cd && cd ~/Sites/Notes/private && touch "$1.md"
    code .
    }

function addNoteWork() {
    cd && cd ~/Sites/Notes/work && touch "$1.md"
    code .
    }

function md-docx() {
    if [ "$#" -ne 1 ]; then
    echo "Usage: File to open without extension"
    exit 1
    fi 
    basename="$1"
    filename="${basename%.*}"
    pandoc -s $filename.md -o $filename.docx
}

# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
function compresspdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"ebook"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}