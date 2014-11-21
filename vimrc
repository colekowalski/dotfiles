set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'altercation/vim-colors-solarized.git'
Plugin 'bling/vim-airline'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

set t_Co=256
set background=dark
let g:rehash256=1
colorscheme solarized
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
let g:airline_theme='solarized'
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

