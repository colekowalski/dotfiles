set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic.git'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

set t_Co=256
set background=dark
let g:molokai_original=1
colorscheme molokai
syntax on

let mapleader = ","

set backspace=indent,eol,start  " intuitive backspace handling

set tabstop=2
set softtabstop=2
set shiftwidth=2

set expandtab
set autoindent
set smartindent

set history=1000                " lines of history to remember
set undolevels=1000             " number of levels of undo
set undodir=~/.cache/vim/undo   " persistent undo
set undofile

set nowrap                      " disable line wrapping

set number                      " show line numbers
set ruler                       " show the cursor position

set showcmd                     " display imcomplete commands
set showmode                    " display the mode we are in

set nocursorline                " highlight current line
set nocursorcolumn              " highlight current column

set nobackup                    " don't create backup files
set nowritebackup               " ditto
set noswapfile                  " don't have much of a need for these

set synmaxcol=1024              " syntax coloring long lines is slow

" jump to last cursor position when opening a file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'
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

" source user settings
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" source project settings
if filereadable('.vimrc.local')
  source .vimrc.local
endif
