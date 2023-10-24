require("neotest").setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "yarn test --",
        jestConfigFile = "jest.config.ts",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
    }),

    -- require("neotest-python")
  }
})

-- Keymaps for running tests.
-- Test file.
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {})
-- Test nearest case.
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", {})
-- Debug.
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", {})
-- Stop.
vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", {})
