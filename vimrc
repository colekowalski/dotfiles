set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
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

" ctrl-p
map <leader>f :CtrlP<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|/target/|/project/target/|/project/project/',
  \ 'file': '\v\.%(class|o|png|jpg|jpeg|bmp|jar)$',
  \ }

" NERDTree stuff...
map <leader>t :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 1      " close nerdtree after opening a file
autocmd vimenter * wincmd p     " start vim in non-nerdtree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

