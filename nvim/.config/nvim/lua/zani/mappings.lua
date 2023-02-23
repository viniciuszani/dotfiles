local M = {}

-- Functional wrapper for mapping custom keybindings
--  mode = 'n' for Normal, 'i' for Insert modes
--  shorcut = ex: '<leader>a'
--  command = what is going to be executed
--  opts = check 'h: map-arguments' to understand more
function M.map(mode, shortcut, command, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

return M
