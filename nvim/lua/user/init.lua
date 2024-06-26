return {
  colorscheme = "onenord-light",

  lsp = {
    formatting = {
      format_on_save = {
        enabled = false,
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes. Also, this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here.
  polish = function()
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
  end,
}
