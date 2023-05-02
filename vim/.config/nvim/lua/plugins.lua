return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'arcticicestudio/nord-vim'
  use 'derekwyatt/vim-scala'
  use 'fatih/vim-go'
  use 'gisraptor/vim-lilypond-integrator'
  use 'gre/play2vim'
  use 'hashivim/vim-terraform'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'petertriho/cmp-git',
      'ray-x/cmp-treesitter',
    }
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'kylechui/nvim-surround'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'rodjek/vim-puppet'
  use 'saltstack/salt-vim'
  --use 'scrooloose/nerdtree'
  --use 'Shougo/neomru.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
end)
