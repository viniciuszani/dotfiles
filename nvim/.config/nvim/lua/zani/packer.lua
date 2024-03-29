-- This file can be loaded by calling `lua require('plugins')` from your init.vimpack

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope fzf
  -- Using live grep, so ensure to have ripgrep installed:
  -- https://github.com/BurntSushi/ripgrep
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
  -- or                            , branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- Telescope file browsing with actions.
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    }
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

  -- Prettier / linting.
  -- Depends on: https://github.com/fsouza/prettierd
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- Method signature assistant (for parameters)
  use 'ray-x/lsp_signature.nvim'

  -- LSP error messages using theme values.
  use 'folke/lsp-colors.nvim'

  -- Undo tree
  use 'mbbill/undotree'

  -- Git from neovim.
  use 'tpope/vim-fugitive'
  -- With GitHub so :GBrowse works.
  use 'tpope/vim-rhubarb'

  -- File browser.
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps',
  }


  -- Debugger
  -- Install datapters: https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
  use 'mfussenegger/nvim-dap'
  use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

  -- Run tests
  use {
    "nvim-neotest/neotest",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      -- Test runners
      'haydenmeade/neotest-jest',
      'nvim-neotest/neotest-python',
    }
  }

  -- Navigating on the screen using fewer keystrokes.
  use 'ggandor/leap.nvim'

  -- Git integration: current file status.
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

  -- Editor Tab styling.
  use 'nanozuki/tabby.nvim'

  -- Comment toggling utility.
  use 'numToStr/Comment.nvim'

  -- Manipulate surrounding elements easier.
  use 'tpope/vim-surround'

  -- Lua method signature helper.
  use 'folke/neodev.nvim'

  -- Hello, rust.
  -- use 'simrat39/rust-tools.nvim'

  -- Time has come: ChatGPT
  use({
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  -- Time has come again: Copilot
  use 'github/copilot.vim'

  -- WARN: test it.
  -- NOTE: it works.
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Better indentation.
  use "lukas-reineke/indent-blankline.nvim"

  -- Rust lang defaults for neovim.
  -- Neovim has some rust support natively, but it's often outdated and buggy.
  use 'rust-lang/rust.vim'

  -- Nice notifications.
  use 'rcarriga/nvim-notify'

  -- Some goodies.
  use { 'echasnovski/mini.nvim', branch = 'stable' }

  -- Python refactoring utilities.
  use({
    'python-rope/ropevim',
    ft = { 'python' }
  })

  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("gitlinker").setup()

      vim.api.nvim_set_keymap('n', '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
      vim.api.nvim_set_keymap('v', '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {})
    end
  }
end)

