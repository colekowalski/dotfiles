set nocompatible

call plug#begin('~/.cache/vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'derekwyatt/vim-scala'
Plug 'gre/play2vim'
Plug 'mhinz/vim-grepper'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'
call plug#end()

filetype plugin indent on

let g:python3_host_prog = expand('~/.virtualenvs/neovim/bin/python3')

set t_Co=256
set background=dark
let base16colorspace=256
colorscheme base16-solarized-dark
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

set number relativenumber       " show hybrid line numbers
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

" sort scala imports into groups
let g:scala_sort_across_groups=1

" vim-grepper
nmap <leader>gr :Grepper<cr>
nmap <leader>gw :Grepper -cword<cr>

nnoremap <leader>f :Denite file_rec<cr>
nnoremap <leader>b :Denite buffer file_mru<cr>

" airline
let g:airline_theme='base16_solarized'
let g:airline_powerline_fonts=1
set laststatus=2

" NERDTree stuff...
map <leader>t :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 1      " close nerdtree after opening a file
autocmd vimenter * wincmd p     " start vim in non-nerdtree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:deoplete#enable_at_startup = 1

" source user settings
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" source project settings
if filereadable('.vimrc.local')
  source .vimrc.local
endif
