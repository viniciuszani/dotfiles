-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope fzf
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Themes section
  use 'arcticicestudio/nord-vim'
  use 'morhetz/gruvbox'
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup()
    end
  })

  -- Treesitter / LSP
  use('nvim-treesitter/nvim-treesitter',  { run = ':TSUpdate'})
  use 'nvim-treesitter/playground'

  -- Code completion
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  -- Method signature assistant (for parameters)
  use 'ray-x/lsp_signature.nvim'

  -- Harpoon for quick file buffers
  use 'ThePrimeagen/harpoon'

  -- Undo tree
  use 'mbbill/undotree'

  -- Git from neovim.
  use 'tpope/vim-fugitive'

  -- File browser.
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps',
  }

  -- Debugger
  use 'puremourning/vimspector'

  -- Run tests
  use 'vim-test/vim-test'

  -- Focus only on the current code block
  use 'koenverburg/peepsight.nvim'

  -- Navigating on the screen using fewer keystrokes.
  use 'ggandor/leap.nvim'
end)

