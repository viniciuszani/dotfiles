require('peepsight').setup({
  -- typescript
  "class_declaration",
  "method_definition",
  "arrow_function",
  "function_declaration",
  "generator_function_declaration"
})

-- Disabled. Avoid flickering colors for a while.
-- vim.cmd.PeepsightEnable()
