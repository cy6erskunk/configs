Configs
=======
My VIM configs, git-prompt with config bashrc and basic gitconfig.

## Installation
1. Clone repo to your home directory:

    ```https://github.com/cy6erskunk/configs.git -b vundle --recursive```

    It is assumed by the installtion script, that repo is cloned to `~/configs`, which is done by default.
2. cd to the `configs` folder and run `install.sh`:

    ```cd configs && . ./install.sh```

    The installer does:
    - creates symlinks to files and folders in `configs` dir (if such file or folder does not exist in home folder)
        - files
            * .vimrc
            * .gitconfig
            - .bashrc
            - git-prompt.conf
        - folders
            - .vim
            - git-prompt
    - creates `~/tmp` folder if none
    - gets Vundle
    - installs several Vim plugins using Vundle:
      - vim-fugitive
      - vim-easymotion
      - L9
      - FuzzyFinder
    - tries to get submodules (just in case initial `git-clone` was called without `--recursive`)


## Misc

1. To make .bashrc to be executed at login on FreeBSD sometimes (depends on system configuration) it is required to create `~/.profile`
   file with following content:

    ```shell
    # if running bash
    if [ -n "$BASH_VERSION" ]; then
        # include .bashrc if it exists
        if [ -f "$HOME/.bashrc" ]; then
            . "$HOME/.bashrc"
        fi
    fi
    ```

2. There's `.bashrc_local` file, empty by default, which is executed from `.bashrc` - it is a good place to put your local functions etc.

3. In older git versions there're problems with git submodules, it seems that everything OK since version 1.6.2
