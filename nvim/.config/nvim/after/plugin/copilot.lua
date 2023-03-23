-- Ensure that you have node version 16+ installed (nvm) and set the path
-- below.
vim.g.copilot_node_command = "~/.nvm/versions/node/v16.19.1/bin/node"
-- cmp is using Tab for now: :map <Tab>
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

