set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/syntastic.git'

call vundle#end()
filetype plugin indent on

set t_Co=256
set background=dark
let g:rehash256=1
colorscheme molokai
syntax on

let mapleader = ","

set tabstop=2
set softtabstop=2
set shiftwidth=2

set expandtab
set autoindent
set smartindent

set nowrap          " disable line wrapping

set number          " show line numbers
set ruler           " show the cursor position

set showcmd         " display imcomplete commands
set showmode        " display the mode we are in

set nocursorline    " highlight current line
set nocursorcolumn  " highlight current column

set nobackup        " don't create backup files
set nowritebackup   " ditto
set noswapfile      " don't have much of a need for these

" airline
let g:airline_powerline_fonts=1
set laststatus=2

" File-type specific settings
"autocmd FileType ruby set ts=2|set sw=2|set et
"autocmd FileType html set ts=2|set sw=2|set et
"autocmd FileType javascript set ts=2|set sw=2|set et
"autocmd FileType coffee set ts=2|set sw=2|set et
"autocmd FileType clojure set ts=2|set sw=2|set et
"autocmd FileType scala set ts=2|set sw=2|set et
"autocmd FileType php set ts=4|set sw=4|set et
"autocmd FileType go set ts=4|set sw=4|set noet

" ctrl-p
map <leader>f :CtrlP<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|/target/|/project/target/|/project/project/',
  \ 'file': '\v\.%(class|o|png|jpg|jpeg|bmp|jar)$',
  \ }

" NERDTree stuff...
"autocmd vimenter * NERDTree     "auto start nerdtree
map <leader>t :NERDTreeToggle<cr>
autocmd vimenter * wincmd p     "start vim in non-nerdtree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

