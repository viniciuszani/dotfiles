local builtin = require('telescope.builtin')

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

local file_browser= require("telescope").extensions.file_browser

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Grepping section. This helps A LOT.
-- Fzf on grep
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
-- First grep, then fzf.
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- LSP goodies.
vim.keymap.set('n', '<C-s>', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<C-t>', builtin.lsp_references, {})

-- Telescope file browsing.
vim.keymap.set('n', '<C-f>', function() file_browser.file_browser() end, {})

