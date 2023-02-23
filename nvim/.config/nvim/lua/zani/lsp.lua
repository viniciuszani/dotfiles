local map = require("zani.mappings").map

-- LSP configured automatically using:
-- https://github.com/williamboman/mason-lspconfig.nvim
require("mason").setup()
mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "jsonls",
    "tsserver",
    "pyright"
  }
})

mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup {}
  end
})

-- Tree sitter.
require "nvim-treesitter.configs".setup {
  ensure_installed = { 
    "bash",
    "comment",
    "c", 
    "css",
    "dart",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua", 
    "python",
    "tsx",
    "typescript",
    "yaml",
    "vim" 
  },

  auto_install = true,

  highlight = {
    enable = true,
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      --toggle_query_editor = 'o',
      --toggle_hl_groups = 'i',
      --toggle_injected_languages = 't',
      --toggle_anonymous_nodes = 'a',
      --toggle_language_display = 'I',
      --focus_language = 'f',
      --unfocus_language = 'F',
      --update = 'R',
      --goto_node = '<cr>',
      --show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}

-- Autocomplete using COQ, auto start.
vim.g.coq_settings = {
  ["auto_start"] = 'shut-up',
}


