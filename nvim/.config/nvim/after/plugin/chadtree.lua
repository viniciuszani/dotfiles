vim.keymap.set("n", "<leader>fb", vim.cmd.CHADopen)

local chadtree_settings = {
  keymap = {
    tertiary = { 't' }, -- Opens the file under the cursor in a new tab.
    v_split = { 'v' }, -- Opens the file under the cursor in a vertical split.
    trash = {}, -- Disable trash. YOLO.
  }
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
