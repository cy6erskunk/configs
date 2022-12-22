Configs
=======
My VIM configs, prompt with config zshhrc and basic gitconfig.

## Prerequisites
1. [oh-my-zsh](https://ohmyz.sh)
2. [Starship](https://starship.rs) command prompt (which requires a font with lots of glyphs, e.g. from [Nerd fonts](https://github.com/ryanoasis/nerd-fonts/))


## Installation
1. Clone repo to your home directory:

    ```sh
    git clone https://github.com/cy6erskunk/configs.git
    ```

    It is assumed by the installtion script, that repo is cloned to `~/configs`, which is done by default.
2. `cd` to the `configs` folder and run `install.sh`:

    ```sh
    cd configs && . ./install.sh
    ```

    Enter your name and email to filled in `.gitconfig` when prompted (add `--no-gitconfig`
    to `install.sh` call to skip git user name and email setting)

    The installer does:
    - creates `.gitgonfig` file with some defaults and `user.name`, `user.email` filled
      with data provided
    - creates symlinks to files and folders in `configs` dir (if such file or folder does not exist in home folder)
        - files
            * .vimrc
            * .gitconfig
            - .zshrc
            - .zshrc_aliases
        - folders
            - .vim
    - creates `~/tmp` folder if none
    - gets Vundle
    - installs several Vim plugins using Vundle:
      - vim-fugitive
      - vim-easymotion
      - L9
      - FuzzyFinder


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

4. `_sublime2_Packages_User` folder for now is just a snapshot of my useful settings files for Sublime Text 2, which should be copied to `~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/` folder (on Mac)
