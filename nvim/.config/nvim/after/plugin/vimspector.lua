-- Mappings for debugging.
vim.keymap.set("n", "<leader>di", vim.cmd.VimspectorBalloonEval)
vim.keymap.set("n", "<leader>db", vim.cmd.VimspectorToggleBreakpoint)
vim.keymap.set("n", "<leader>dr", vim.cmd.VimspectorClearBreakpoints)
vim.keymap.set("n", "<leader>dc", vim.cmd.VimspectorRunToCursor)


-- Unit testing debugging.
-- Requires vim-test.
--function JestStrategy(testName)
--  vim.cmd.VimspectorLaunchWithSettings({
--    configuration = 'jest',
--    TestName = testName
--  })
--end

vim.cmd([[
  function! JestStrategy(cmd)
    let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
    call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
  endfunction

  let g:test#custom_strategies = {'jest': function('JestStrategy')}
  let g:test#javascript#file_pattern = '.*\.(spec|test).*\.(j|t)s'
]])

vim.keymap.set("n", "<leader>dt", function() vim.cmd([[:TestNearest -strategy=jest]]) end)

