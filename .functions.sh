# !/bin/bash

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

function addNote() {
    cd && cd ~/Sites/Notes/$1 && touch "$2.md"
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