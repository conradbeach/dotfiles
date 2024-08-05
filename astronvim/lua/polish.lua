-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- TODO: According to the [migraiton guide](https://docs.astronvim.com/configuration/v4_migration/),
-- there are new `autocmds` and `commands` keys that can be used for the below configuration.

-- Switch to last active tab.
vim.api.nvim_create_autocmd("TabLeave",  {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_keymap(
          'n',
          '<Leader>0',
          '<cmd>tabn ' .. vim.api.nvim_tabpage_get_number(0) .. '<CR>',
          { noremap = true, silent = true }
        )
    end
})

-- vim-test/vim-test
vim.cmd("let test#strategy = 'toggleterm'")
vim.cmd("let test#ruby#rspec#executable = 'bundle exec rspec --format=documentation'")

-- codota/tabnine-nvim
vim.api.nvim_command("TabnineDisable") -- I only want chat.

-- tpope/vim-rails
-- Open the alternate file in a vertical split even if it doesn't exist.
vim.cmd("command AC :vsplit | execute 'e ' . eval('rails#buffer().alternate()')")
