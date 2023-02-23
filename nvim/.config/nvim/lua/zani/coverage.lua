
local map = require('zani.mappings').map

require('coverage').setup({
  auto_reload = true,
})

map('n', '<leader>cc', ':CoverageSummary')
