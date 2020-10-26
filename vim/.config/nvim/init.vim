set nocompatible

call plug#begin('~/.cache/vim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'gre/play2vim'
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.cache/fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rodjek/vim-puppet'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

filetype plugin indent on

let g:python3_host_prog = expand('~/.virtualenvs/neovim/bin/python3')

let g:gruvbox_contrast_dark = 'hard'

set t_Co=256
set background=dark
colorscheme gruvbox
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

set cursorline                " highlight current line
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

" fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>

let g:lightline = {
  \ 'colorscheme': 'one'
  \ }

" NERDTree stuff...
map <leader>t :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen = 1      " close nerdtree after opening a file
let NERDTreeMinimalUI = 1       " don't display the help line(s)
autocmd vimenter * wincmd p     " start vim in non-nerdtree buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ripgrep
"g:rg_derive_root = 1

" COC
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>cr :CocRestart

" source user settings
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" source project settings
if filereadable('.vimrc.local')
  source .vimrc.local
endif

