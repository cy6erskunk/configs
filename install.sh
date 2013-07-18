#!/bin/bash
files='.vimrc .gitconfig .bashrc .bash_aliases git-prompt.conf'
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

echo ===Creating ~/tmp folder
if [ -e ~/tmp ]
then
    echo "${tab}~/tmp already exists"
else
    mkdir ~/tmp
    echo Done
fi

echo ===Getting Vim bundles...

if [ -d .vim ]
then
    cd .vim
    make vundle
    make plugins
    cd $pwd
fi
echo Done

# Just in case initial 'git-clone' was called without '--recursive'
echo ===Getting git-prompt...
git submodule init
git submodule update
echo Done
