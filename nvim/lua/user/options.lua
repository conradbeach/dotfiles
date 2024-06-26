-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    colorcolumn = "+1", -- Make it obvious where 80 characters is.
    scrolloff = 8, -- number of lines to keep above and below the cursor
    sidescrolloff = 8, -- number of columns to keep at the sides of the cursor
    relativenumber = false,
    textwidth = 80, -- Make it obvious where 80 characters is.
    wrap = true, -- sets vim.opt.wrap
  },
  g = {
    autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    autopairs_enabled = true, -- enable autopairs at start
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
