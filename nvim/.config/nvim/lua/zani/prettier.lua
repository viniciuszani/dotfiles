-- Source: https://github.com/MunifTanjim/prettier.nvim
--local null_ls = require("null-ls")
--
--null_ls.setup({
--  sources = {
--      require("null-ls").builtins.formatting.stylua,
--      require("null-ls").builtins.diagnostics.eslint,
--      require("null-ls").builtins.completion.spell,
--  },
--
--  on_attach = function(client, bufnr)
--    if client.server_capabilities.documentFormattingProvider then
--      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
--
--      -- format on save
--      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
--    end
--
--    if client.server_capabilities.documentRangeFormattingProvider then
--      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
--    end
--  end,
--})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

-- https://github.com/neovim/nvim-lspconfig/wiki/Multiple-language-servers-FAQ#i-see-multiple-formatting-options-and-i-want-a-single-server-to-format-how-do-i-do-this

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
      filter = function(client)
          -- apply whatever logic you want (in this example, we'll only use null-ls)
          return client.name == "null-ls"
      end,
      bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
              lsp_formatting(bufnr)
          end,
      })
  end
end
