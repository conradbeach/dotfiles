-- Adapted from: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/vscode/init.lua

if not vim.g.started_by_firenvim then return {} end -- Don't do anything in non-firenvim instances

local enabled = {}
vim.tbl_map(function(plugin) enabled[plugin] = true end, {
  "lazy.nvim",
  "firenvim",
  "AstroNvim",
  "astrocore",
  "nvim-surround",
  "leap.nvim",
})

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return enabled[plugin.name] end

vim.o.background = "light"
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function() vim.api.nvim_set_hl(0, "Normal", { bg = "#EBEBEB" }) end,
})

-- Set up mappings directly since astrocore may not process them in firenvim
local map = vim.keymap.set
map("n", "^", "0")
map("n", "0", "^")
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "[e", "<cmd>m -2<cr>")
map("n", "]e", "<cmd>m +1<cr>")
map({ "n", "x", "o" }, "<Leader>w", "<Plug>(leap)")
map({ "n", "x", "o" }, "<Leader>X", "<Plug>(leap-cross-window)")
map({ "n", "x" }, "<D-v>", '"+p')
map("i", "<D-v>", '<C-r>+')
map("c", "<D-v>", '<C-r>+')
