-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
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
local ignore_filetypes = { 'NvimTree', 'Avante', 'aerial' }
local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

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

-- vim-test/vim-test
vim.cmd "let test#strategy = 'toggleterm'"
vim.cmd "let test#ruby#rspec#executable = 'bundle exec rspec --format=documentation'"

-- codota/tabnine-nvim
if not vim.g.vscode then
  vim.api.nvim_command "TabnineDisable" -- I only want chat.
end

-- tpope/vim-rails
-- Open the alternate file in a vertical split even if it doesn't exist.
vim.cmd "command AC :vsplit | execute 'e ' . eval('rails#buffer().alternate()')"

-- AndrewRadev/splitjoin.vim
-- Adding these to the mappings table didn't work for some reason.
vim.api.nvim_set_keymap("n", "gJ", "<cmd>silent SplitjoinJoin<CR>", {})
vim.api.nvim_set_keymap("n", "gS", "<cmd>silent SplitjoinSplit<CR>", {})
