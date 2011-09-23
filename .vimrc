syntax on " Подсветка синтаксиса
set sw=4 " Сдвиг при использовании > или < 
set ts=4 " Размер tab
set ai " (no)autoindent
set bg=light " светлый фон
set expandtab " заменять табы на пробелы
set list " показывать спецсимволы
set dir=~/tmp " хранить swp файлы в ~/tmp
set ruler " показывать номера строк и стобцов внизу экрана
set showmode " показывать текущий режим
set formatoptions+=r " автоматически добавлять символ коментария при переходе на новую строку при редактировании комментария
filetype plugin on
set hlsearch " подсвечивать при поиске

" Маппинги
:nmap <F2> :w<CR>
:nmap <F4> :tabnew 
:nmap e :tabnew 
:nmap <F6> :NERDTree<CR>
:nmap <F7> :tabp<CR>
:nmap <F8> :tabn<CR>
:nmap <F10> :bw<CR>
:nmap <S-F10> :xa<CR>
:nmap <ENTER> :
:nmap <Tab> <C-w>w
:nmap <S-Tab> <C-w>W

" Зовем pathogen
call pathogen#runtime_append_all_bundles()

