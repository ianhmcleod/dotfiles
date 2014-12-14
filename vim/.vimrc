set nocompatible              " be iMproved
filetype plugin on

filetype on
syntax enable
filetype indent on

set cursorline
set relativenumber
set laststatus=2
set ttimeoutlen=50
set t_Co=256
set completeopt=menu

set expandtab
set tabstop=4
set shiftwidth=4


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'zachgersh/vim-colorschemes'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'Raimondi/delimitMate'
Bundle 'klen/python-mode'
Bundle 'mattn/emmet-vim'
Bundle 'garbas/vim-snipmate'
Bundle 'chrisgillis/vim-bootstrap3-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle "tomtom/tlib_vim"
Bundle 'vim-scripts/vimwiki'

colorscheme tomorrownight

" mappings
imap jk <Esc>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

let g:pymode = 1
let g:pymode_virtualenv = 1
let g:pymode_doc = 0
let g:NERDTreeWinSize = 20
