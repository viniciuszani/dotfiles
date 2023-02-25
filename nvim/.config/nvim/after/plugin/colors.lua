
function SetColor(color)
  -- Options: gruvbox | rose-pine | nord
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)
end

SetColor()
