#!/bin/bash
files='.vimrc .gitconfig .zshrc .zshrc_aliases .tmux.conf'
dirs='.vim'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function print_done() {
    printf "[ ${GREEN}done${NC} ]\n"
}

function print_skipped() {
    printf "[ ${ORANGE}skipped${NC} ]\n"
}

if [[  $1 != '--no-gitconfig' ]]
then
    echo Enter your git name:
    read git_name
    echo Enter your git email:
    read git_email
    sed -e "s/%%GIT_NAME%%/${git_name}/;s/%%GIT_EMAIL%%/${git_email}/" < ./_gitconfig > ./.gitconfig

    echo name: $git_name email: $git_email
    echo Remember to add conditional includes to support different configurations for different paths
    echo An example is provided at the end the newly created .gitconfig file 
fi

tab=$'\t'
ttab="$tab$tab$tab"
pwd=`pwd`

function iterate_items() {
    for file in $1
    do
        if [ -e ~/$file ];
        then
            printf "$tab$file already exists in home directory${ttab}"
            print_skipped
        else
            printf "${tab}creating symlink for $file...$ttab"
            ln -s $pwd/$file ~/$file
            print_done
        fi
    done
}

echo ===Creating symlinks...
iterate_items "${files}"
iterate_items "${dirs}"
echo Done

echo ===Creating ~/tmp folder
if [ -e ~/tmp ]
then
    echo "${tab}~/tmp already exists"
    print_skipped
else
    mkdir ~/tmp
    print_done
fi

echo ===Getting Vim bundles...

if [ -d .vim ]
then
    cd .vim
    if [[ -e ".done" ]]
    then
        echo 'Vim budles already inited (`.done` file is present)'
    else
        make plugins
    fi
    cd $pwd
fi
echo Done

