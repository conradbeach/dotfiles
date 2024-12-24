-- Adapted from: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/vscode/init.lua

if not vim.g.started_by_firenvim then return {} end -- Don't do anything in non-firenvim instances

local enabled = {}
vim.tbl_map(function(plugin) enabled[plugin] = true end, {
  "lazy.nvim",
  "firenvim",
  "AstroNvim",
  "astrocore",
  "vim-surround",
  "vim-repeat",
})

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return enabled[plugin.name] end
