local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  -- 'tsserver', -- This server fails to properly identify references.
  'vtsls',
  'eslint',
  'lua_ls',
  'pylsp', -- for python.
  'taplo', -- toml files.
  'yaml-language-server', -- yaml files.
  -- 'sumneko_lua', -- This is not working currently.
})

-- Remap some keys for autocomplete.
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- Mappings to navigate to definitions and so on.
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- Goto definition.
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- Trigger the autocompletion menu.
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- Next / previous selection.
  vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "gp", function() vim.diagnostic.goto_prev() end, opts)
  -- Code actions.
  vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

-- Prevent error messages from creating an extra column on your
-- screen and moving content around all the time.
vim.opt.signcolumn = 'yes'

-- Configure how the LSP error messages are displayed.
-- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.config()
vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)

lsp.setup()
