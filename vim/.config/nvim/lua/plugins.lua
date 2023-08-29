return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --use 'arcticicestudio/nord-vim'
  use 'derekwyatt/vim-scala'
  use 'fatih/vim-go'
  use 'gisraptor/vim-lilypond-integrator'
  use 'github/copilot.vim'
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
  -- use 'karoliskoncevicius/distilled-vim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kylechui/nvim-surround'
  use 'navarasu/onedark.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'numToStr/Comment.nvim'
  use 'rodjek/vim-puppet'
  use 'saltstack/salt-vim'
  use 'tpope/vim-fugitive'
end)
