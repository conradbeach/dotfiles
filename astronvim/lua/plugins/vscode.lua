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
      -- Move line up or down
      maps.n["[e"] = function() require("vscode-neovim").action "editor.action.moveLinesUpAction" end
      maps.n["]e"] = function() require("vscode-neovim").action "editor.action.moveLinesDownAction" end

      -- Yank file paths to clipboard
      maps.n["<Leader>yp"] = function() require("vscode-neovim").action "copyFilePath" end
      maps.n["<Leader>yr"] = function() require("vscode-neovim").action "copyRelativeFilePath" end

      -- Editors and Groups
      maps.n["]t"] = "<Cmd>Tabnext<CR>"
      maps.n["[t"] = "<Cmd>Tabprevious<CR>"
      maps.n["[T"] = function() require("vscode-neovim").action "workbench.action.moveEditorLeftInGroup" end
      maps.n["]T"] = function() require("vscode-neovim").action "workbench.action.moveEditorRightInGroup" end
      maps.n["<Leader>nt"] = function() require("vscode-neovim").action "workbench.action.splitEditor" end
      maps.n["<Leader>nf"] = function() require("vscode-neovim").action "workbench.action.files.newUntitledFile" end
      maps.n["<Leader>ct"] = function() require("vscode-neovim").action "workbench.action.closeEditorsAndGroup" end
      maps.n["<Leader>cow"] = function() require("vscode-neovim").action "workbench.action.closeOtherEditors" end
      maps.n["<Leader>cot"] = function() require("vscode-neovim").action "workbench.action.closeEditorsInOtherGroups" end
      maps.n["<Leader>ce"] = function()
        require("vscode-neovim").action "workbench.action.closeEditorsInOtherGroups"
        require("vscode-neovim").action "workbench.action.closeOtherEditors"
      end

      -- Splits navigation
      maps.n["|"] = function() require("vscode-neovim").action "workbench.action.splitEditor" end
      maps.n["\\"] = function() require("vscode-neovim").action "workbench.action.splitEditorDown" end
      maps.n["<C-H>"] = function() require("vscode-neovim").action "workbench.action.navigateLeft" end
      maps.n["<C-J>"] = function() require("vscode-neovim").action "workbench.action.navigateDown" end
      maps.n["<C-K>"] = function() require("vscode-neovim").action "workbench.action.navigateUp" end
      maps.n["<C-L>"] = function() require("vscode-neovim").action "workbench.action.navigateRight" end

      -- File explorer
      maps.n["<Leader>e"] = function() require("vscode-neovim").action "workbench.files.action.focusFilesExplorer" end
      maps.n["<Leader>fe"] = function() require("vscode-neovim").action "workbench.files.action.showActiveFileInExplorer" end

      -- Indentation
      maps.v["<Tab>"] = function() require("vscode-neovim").action "editor.action.indentLines" end
      maps.v["<S-Tab>"] = function() require("vscode-neovim").action "editor.action.outdentLines" end

      -- Folds
      maps.n["za"] = function() require("vscode-neovim").action "editor.toggleFold" end
      maps.n["zM"] = function() require("vscode-neovim").action "editor.foldAll" end
      maps.n["zR"] = function() require("vscode-neovim").action "editor.unfoldAll" end

      -- Diagnostics
      maps.n["]d"] = function() require("vscode-neovim").action "editor.action.marker.nextInFiles" end
      maps.n["[d"] = function() require("vscode-neovim").action "editor.action.marker.prevInFiles" end

      -- Pickers (emulate Telescope mappings)
      maps.n["<Leader>ff"] = function() require("vscode-neovim").action "workbench.action.quickOpen" end
      maps.n["<Leader>fw"] = function() require("vscode-neovim").action "workbench.action.findInFiles" end
      maps.n["<Leader>fc"] = function()
        require("vscode-neovim").action("workbench.action.findInFiles", { args = { query = vim.fn.expand "<cword>" } })
      end
      maps.n["<Leader>fo"] = function() require("vscode-neovim").action "workbench.action.openPreviousEditorFromHistory" end
      maps.n["<Leader>fn"] = function() require("vscode-neovim").action "notifications.showList" end
      maps.n["<Leader>fC"] = function() require("vscode-neovim").action "workbench.action.showCommands" end

      -- Git
      maps.v["<Leader>gr"] = function() require("vscode-neovim").action "git.revertSelectedRanges" end
      maps.n["<Leader>gr"] = function() require("vscode-neovim").action "git.clean" end
      maps.n["]g"] = function() require("vscode-neovim").action "workbench.action.editor.nextChange" end
      maps.n["[g"] = function() require("vscode-neovim").action "workbench.action.editor.previousChange" end

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
