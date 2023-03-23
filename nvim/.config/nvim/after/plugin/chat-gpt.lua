require("chatgpt").setup({
  openai_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "code-davinci-edit-001",
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  keymaps = {
    close = { "q" },
    submit = "<Enter>",
    yank_last = "<C-y>",
    yank_last_code = "<C-k>",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    toggle_settings = "<C-o>",
    new_session = "<C-n>",
    cycle_windows = "<C-t>",
    -- in the Sessions pane
    select_session = "<Space>",
    rename_session = "r",
    delete_session = "d",
  },
})

vim.keymap.set("n", "<C-c>", [[:ChatGPT<CR>]], {})
vim.keymap.set("n", "<C-e>", [[:ChatGPTEditWithInstructions<CR>]], {})

