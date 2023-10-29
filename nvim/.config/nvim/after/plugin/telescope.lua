local builtin = require('telescope.builtin')

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      hidden = true,
    },

    -- live_grep_args = { 
    --   search_dirs = "",
    --
    -- }
  },

  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".yarn",
    },

    vimgrep_arguments = {
       "rg",
       "--color=never",
       "--no-heading",
       "--with-filename",
       "--line-number",
       "--column",
       "--smart-case"
    },

    -- Filesystem cat (bat)
    file_previewer = require("telescope.previewers").cat.new,

    -- Use bat for grep preview too
    grep_previewer = require("telescope.previewers").vimgrep.new
  }
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

local file_browser= require("telescope").extensions.file_browser

-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', function ()
  builtin.find_files({
    hidden = true -- show hidden files.
  })
end, {})

-- Grepping section. This helps A LOT.

-- Grep token under cursor and then telescope the files.
-- Includes hidden folders.
vim.keymap.set('n', '<C-g>', function ()
  builtin.grep_string({
    glob_pattern = "*/**/*",
    search = vim.fn.expand("<cword>")
  })
end, {})

-- Live grep anything instead of current token.
vim.keymap.set('n', '<leader>gg', function ()
  builtin.live_grep({
    glob_pattern = "*/**/*",
    search = vim.fn.expand("<cword>")
  })
end, {})

-- LSP goodies.
vim.keymap.set('n', '<C-s>', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<C-t>', builtin.lsp_references, {})

-- Telescope file browsing.
vim.keymap.set('n', '<C-f>', function() file_browser.file_browser() end, {})

