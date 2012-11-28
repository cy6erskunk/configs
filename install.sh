#!/bin/bash
files='.vimrc .gitconfig .bashrc git-prompt.conf'
dirs='.vim git-prompt'

tab=$'\t'
ttab="$tab$tab$tab"
pwd=`pwd`

echo ===Creating symlinks...

for file in $files
do
    if [ -e ~/$file ]
    then
        echo "$tab$file already exists in home directory"
    else
        echo -n "${tab}creating symlink for $file...$ttab"
        ln -s $pwd/$file ~/$file
        echo '[ done ]'
    fi
done

for dir in $dirs
do
    if [ -e ~/$dir ]
    then
        echo "$tab$dir already exists in home directory"
    else
        echo -n "${tab}creating symlink for $dir...$ttab"
        ln -s $pwd/$dir/ ~/$dir
        echo '[ done ]'
    fi
done
echo Done

echo ===Getting Vim bundles...

if [ -d .vim ]
then
    cd .vim
    make
    cd $pwd
fi
echo Done

echo ===Getting git-prompt...
git submodule init
git submodule update
echo Done
