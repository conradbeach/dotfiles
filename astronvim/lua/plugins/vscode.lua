-- Source: https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/vscode/init.lua

if not vim.g.vscode then return {} end -- don't do anything in non-vscode instances

local enabled = {}
vim.tbl_map(function(plugin) enabled[plugin] = true end, {
  -- core plugins
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "leap.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "splitjoin.vim",
  "vim-rails",
  "vim-surround",
  "vim-swap",
  "vim-repeat",
  "vim-test",
})

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return enabled[plugin.name] end

---@type LazySpec
return {
  -- add a few mappings and options
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local options = assert(opts.options)
      local maps = assert(opts.mappings)

      -- Options
      options.opt.cmdheight = 1

      -- Mappings
      -- splits navigation
      maps.n["|"] = function() require("vscode-neovim").action "workbench.action.splitEditor" end
      maps.n["\\"] = function() require("vscode-neovim").action "workbench.action.splitEditorDown" end
      maps.n["<C-H>"] = function() require("vscode-neovim").action "workbench.action.navigateLeft" end
      maps.n["<C-J>"] = function() require("vscode-neovim").action "workbench.action.navigateDown" end
      maps.n["<C-K>"] = function() require("vscode-neovim").action "workbench.action.navigateUp" end
      maps.n["<C-L>"] = function() require("vscode-neovim").action "workbench.action.navigateRight" end

      -- file explorer
      maps.n["<Leader>e"] = function() require("vscode-neovim").action "workbench.files.action.focusFilesExplorer" end
      maps.n["<Leader>fe"] = function() require("vscode-neovim").action "workbench.files.action.showActiveFileInExplorer" end

      -- indentation
      maps.v["<Tab>"] = function() require("vscode-neovim").action "editor.action.indentLines" end
      maps.v["<S-Tab>"] = function() require("vscode-neovim").action "editor.action.outdentLines" end

      -- folds
      maps.n["za"] = function() require("vscode-neovim").action "editor.toggleFold" end
      maps.n["zM"] = function() require("vscode-neovim").action "editor.foldAll" end
      maps.n["zR"] = function() require("vscode-neovim").action "editor.unfoldAll" end

      -- diagnostics
      maps.n["]d"] = function() require("vscode-neovim").action "editor.action.marker.nextInFiles" end
      maps.n["[d"] = function() require("vscode-neovim").action "editor.action.marker.prevInFiles" end

      -- pickers (emulate telescope mappings)
      maps.n["<Leader>fn"] = function() require("vscode-neovim").action "notifications.showList" end
      maps.n["<Leader>fc"] = function()
        require("vscode-neovim").action("workbench.action.findInFiles", { args = { query = vim.fn.expand "<cword>" } })
      end

      -- git client
      maps.n["<Leader>gg"] = function() require("vscode-neovim").action "workbench.view.scm" end

      -- LSP Mappings
      maps.n["K"] = function() require("vscode-neovim").action "editor.action.showHover" end
      maps.n["gI"] = function() require("vscode-neovim").action "editor.action.goToImplementation" end
      maps.n["gd"] = function() require("vscode-neovim").action "editor.action.revealDefinition" end
      maps.n["gD"] = function() require("vscode-neovim").action "editor.action.revealDeclaration" end
      maps.n["gr"] = function() require("vscode-neovim").action "editor.action.goToReferences" end
      maps.n["gy"] = function() require("vscode-neovim").action "editor.action.goToTypeDefinition" end
      maps.n["<Leader>la"] = function() require("vscode-neovim").action "editor.action.quickFix" end
      maps.n["<Leader>lG"] = function() require("vscode-neovim").action "workbench.action.showAllSymbols" end
      maps.n["<Leader>lR"] = function() require("vscode-neovim").action "editor.action.goToReferences" end
      maps.n["<Leader>lr"] = function() require("vscode-neovim").action "editor.action.rename" end
      maps.n["<Leader>ls"] = function() require("vscode-neovim").action "workbench.action.gotoSymbol" end
      maps.n["<Leader>lf"] = function() require("vscode-neovim").action "editor.action.formatDocument" end
    end,
  },

  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- disable treesitter highlighting
  { "nvim-treesitter/nvim-treesitter", opts = { highlight = { enable = false } } },
}
