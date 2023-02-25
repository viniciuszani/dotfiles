local builtin = require('telescope.builtin')

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

