set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on

set t_Co=256
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
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

set mouse-=a                    " disable mouse support

nmap <leader>d :%s/\s\+$//e<cr> " delete trailing whitespace

" jump to last cursor position when opening a file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
set laststatus=2

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
