
require("dap-vscode-js").setup({
  node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "/home/vinicius/dev/microsoft/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = {
    'pwa-node',
    'pwa-chrome',
    'pwa-msedge',
    'node-terminal',
    'pwa-extensionHost',
  }, -- which adapters to register in nvim-dap

  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})


local dap = require('dap')
dap.set_log_level('DEBUG')
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   -- In order to make this plugin work:
--   -- TODO: add instructions.
--   args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/dist/src/build/nodeCustom.js'},
--   args = { mason_path .. "package/node-debug2-adapter/out/src/nodeDebug.js" }
--
-- }

-- Use Mason installer to get the packages mentioned below:
--  node-debug2-adapter
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  -- args = { mason_path .. "package/node-debug2-adapter/out/src/nodeDebug.js" }
}

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      -- for this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'attach to process',
      type = 'pwa-node', -- was node2
      request = 'attach',
      processid = require'dap.utils'.pick_process,
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourcemaps = true,
      protocol = "inspector",
    },
  }

end
