set nocompatible " зачем совместимость с vi?

filetype on
filetype plugin on
filetype indent on

syntax on " Подсветка синтаксиса
set sw=4 " Сдвиг при использовании > или <
set ts=4 " Размер tab
set softtabstop=3
set expandtab " заменять табы на пробелы

set ai " autoindent
set smartindent

if has("gui_running")
    " use zenburn theme in gvim
    colorscheme zenburn
else
    "in xterm with black background
    " use default theme with light background
    set bg=light
    colorscheme default
endif

set dir=~/tmp " хранить swp файлы в ~/tmp

set list " показывать спецсимволы
set ruler " показывать номера строк и стобцов внизу экрана
set showcmd
set showmode " показывать текущий режим
set laststatus=2 "always show status bar

set showmatch

set wrap
set textwidth=89
set formatoptions+=r " автоматически добавлять символ коментария при переходе на новую строку при редактировании комментария

set hlsearch " подсвечивать при поиске
set incsearch
set ignorecase
set smartcase

set grepprg=ack-grep
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

" Маппинги
:nmap e :tabnew 
:nmap <ENTER> :
:nmap <SPACE> :!
:imap jj <esc>

:nmap <Tab> <C-w>w
:nmap <S-Tab> <C-w>W

:nmap <F2> :w<CR>
:nmap <silent> <F3> :%s/^ \+$//\|:%s/ \+$//<CR>
:nmap <F4> :tabnew
:nmap <F6> :NERDTree<CR>
:nmap <F7> :tabp<CR>
:nmap <F8> :tabn<CR>
:nmap <F10> :bw<CR>
:nmap <S-F10> :xa<CR>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Зовем pathogen
call pathogen#runtime_append_all_bundles()

" assign custon filetypes for highlighting
au BufRead,BufNewFile *.hbs set filetype=html

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif
