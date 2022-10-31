set nocompatible " disable vi compatibility

filetype off " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'vim-scripts/xml.vim'

call vundle#end()

filetype plugin on
filetype indent on

syntax on

set sw=4 " Shift when using > or <
set ts=4 " tab size
set softtabstop=4
set expandtab " replace tabs with spaces

set ai " autoindent
set smartindent

" use 256 colors in terminal - we're in 21st century, aren't we?
set t_Co=256
"if has("gui_running")
    " use zenburn theme in gvim
    colorscheme zenburn
"else
    ""in xterm with black background
    ""use default theme with light background
    "set bg=light
    "colorscheme default
"endif

set dir=~/tmp " save files in ~/tmp

set bs=2
set list " show special symbols
set number
set ruler " show line number and columns in the status bar
set showcmd
set showmode " show current mode
set laststatus=2 "always show status bar
function! ShowUtf8Sequence()
    let p = getpos('.')
    redir => utfseq
    sil normal! g8
    redir End
    call setpos('.', p)
    return matchstr(utfseq, '\x .*\x')
endfunction
set statusline=%<%2*%f%*\ %{&ff}\ %{&encoding}\ %y%h%m%r\ %{FugitiveStatusline()}%=%1*0x%03B%-5{ShowUtf8Sequence()}%*\ %-14.(%l,%c%V%)\ %P
hi User1 term=bold,reverse cterm=bold,reverse ctermfg=236 ctermbg=031 gui=bold,reverse
hi User2 term=bold,reverse cterm=bold,reverse ctermfg=236 ctermbg=040 gui=bold,reverse

set showmatch

set wrap
set textwidth=89
set formatoptions+=r " automatically add comment symbol in the beginning of a line when editing a comment

set hlsearch " highlight on search
set incsearch
set ignorecase
set smartcase

set grepprg=ack
set grepformat=%f:%l:%c:%m

set foldenable

" More useful command-line completion
set wildmenu
" Auto-completion menu
set wildmode=list:longest

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf
"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l
"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" Mappings
nnoremap <leader>n :tabnew 
nnoremap <ENTER> :
nnoremap <SPACE> :!
inoremap jj <esc>

nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprev<CR>
":nmap <Tab> <C-w>w
":nmap <S-Tab> <C-w>W
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>t :FufCoverageFile<CR>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp

" insert mode mappings
" delete line
inoremap <C-d> <ESC>ddi
" move line up
inoremap <C-k> <ESC>ddkPi
" move line down
inoremap <C-j> <ESC>ddpi
" change current word to uppercase
inoremap <C-u> <ESC>viwUea

"Bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" assign custon filetypes for highlighting
au BufRead,BufNewFile *.hbs set filetype=html
au BufRead,BufNewFile *.hbsp set filetype=html
au BufRead,BufNewFile *.coffee set filetype=javascript

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif
