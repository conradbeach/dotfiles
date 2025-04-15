-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- TODO: According to the [migraiton guide](https://docs.astronvim.com/configuration/v4_migration/),
-- there are new `autocmds` and `commands` keys that can be used for the below configuration.

-- Switch to last active tab.
vim.api.nvim_create_autocmd("TabLeave", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>0",
      "<cmd>tabn " .. vim.api.nvim_tabpage_get_number(0) .. "<CR>",
      { noremap = true, silent = true }
    )
  end,
})

-- nvim-focus/focus.nvim
local ignore_filetypes = { "NvimTree", "Avante", "aerial" }
local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
    else
      vim.b.focus_disable = false
    end
  end,
  desc = "Disable focus autoresize for FileType",
})

-- AndrewRadev/splitjoin.vim
-- Adding these to the mappings table didn't work for some reason.
vim.api.nvim_set_keymap("n", "gJ", "<cmd>silent SplitjoinJoin<CR>", {})
vim.api.nvim_set_keymap("n", "gS", "<cmd>silent SplitjoinSplit<CR>", {})

-- tpope/vim-rails
-- Open the alternate file in a vertical split even if it doesn't exist.
vim.cmd "command AC :vsplit | execute 'e ' . eval('rails#buffer().alternate()')"

-- Utility function for code block yanking
_G.yank_code_with_context = function(context_text)
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"
  local line_text = start_line == end_line and ("on line " .. start_line)
    or ("on lines " .. start_line .. " to " .. end_line)

  local file_path = vim.fn.fnamemodify(vim.fn.expand "%", ":.")
  local code = vim.fn.getreg '"'

  local result = string.format("In `%s` %s, we have %s:\n```\n%s\n```", file_path, line_text, context_text, code)

  vim.fn.setreg("+", result)
end

-- vim-test/vim-test
vim.cmd [[
  " Modified from https://github.com/vim-test/vim-test/blob/master/autoload/test/strategy.vim
  " I don't like that the built in one returns focus to the editor; I'd prefer it stay on the terminal.
  function! ModifiedVSCodeNeovimStrategy(cmd)
    call VSCodeNotify('workbench.action.terminal.focus')
    call VSCodeNotify('workbench.action.terminal.sendSequence', { 'text': "clear\n" })
    call VSCodeNotify('workbench.action.terminal.sendSequence', { 'text': a:cmd . "\n" })
  endfunction

  let g:test#custom_strategies = { 'modified_neovim_vscode': function('ModifiedVSCodeNeovimStrategy')}
]]

if vim.g.vscode then
  vim.cmd "let test#strategy = 'modified_neovim_vscode'"
else
  vim.cmd "let test#strategy = 'toggleterm'"
end
vim.cmd "let test#ruby#rspec#executable = 'bundle exec rspec --format=documentation'"
