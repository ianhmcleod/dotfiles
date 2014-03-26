set nocompatible              " be iMproved
filetype on


filetype on
syntax enable
filetype indent on

" tabs stuff
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set autoindent
set expandtab

set cursorline
set relativenumber
set laststatus=2
set ttimeoutlen=50

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/taglist.vim'
Bundle 'zachgersh/vim-colorschemes'
Bundle 'tpope/vim-unimpaired'
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'Raimondi/delimitMate'
Bundle 'techlivezheng/vim-plugin-minibufexpl'

" mappings
imap jk <Esc>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
colorscheme wombat256
