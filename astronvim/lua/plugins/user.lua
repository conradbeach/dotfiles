-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
        "                                    ",
        "          What would Jesus do?      ",
      }
      return opts
    end,
  },

  { "max397574/better-escape.nvim", enabled = false },

  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      require("bufferline").setup {
        options = {
          mode = "tabs",
          numbers = function(opts) return string.format("%s)", opts.ordinal) end,
        },
      }
    end,
  },

  { "mattn/emmet-vim", lazy = false },

  { 'glacambre/firenvim', build = ":call firenvim#install(0)" },

  {
    "nvim-focus/focus.nvim",
    lazy = false,
    config = function()
      require("focus").setup {
        ui = {
          cursorline = false, -- Display a cursorline in the focused window only
          signcolumn = false, -- Display signcolumn in the focused window only
        },
      }
    end,
  },

  { "ggandor/leap.nvim", lazy = false },

  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      notify = { enabled = false }, -- AstroNvim already handles this.
      messages = { enabled = false }, -- AstroNvim already handles this.
      lsp = {
        progress = { enabled = false }, -- AstroNvim already handles this.
        signature = { enabled = false }, -- This was causing a conflict.
        hover = { enabled = false }, -- This was causing a conflict.
      },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
  },

  {
    "petertriho/nvim-scrollbar",
    dependencies = "kevinhwang91/nvim-hlslens",
    lazy = false,
    config = function()
      require("scrollbar").setup {
        handlers = {
          gitsigns = true, -- Requires gitsigns
          search = true, -- Requires hlslens
        },
      }
    end,
  },

  {
    "nvim-notify",
    opts = {
      stages = "slide",
      timeout = 1000,
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons", -- optional
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        view = {
          width = {
            min = 30,
            max = 60,
          },
        },
      }
    end,
  },

  { "nvim-treesitter/nvim-treesitter-context", lazy = false },

  {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup {
        custom_colors = {
          bg = "#FFFFFF",
        },
        custom_highlights = {
          light = {
            AvanteConflictCurrent = { bg = "#F7F8FA" },
            AvanteConflictIncoming = { bg = "#F7F8FA" },
          },
        },
      }
    end,
  },

  { "AndrewRadev/splitjoin.vim", lazy = false },

  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup {
        log_level = "warn",
        keymaps = {
          accept_suggestion = "<C-l>",
          accept_word = "<C-o>",
        },
      }
    end,
  },

  { "nvim-telescope/telescope-live-grep-args.nvim" },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
    },
  },

  { "mbbill/undotree", lazy = false },

  { "tpope/vim-rails", lazy = false },

  { "tpope/vim-surround", lazy = false },

  { "machakann/vim-swap", lazy = false },

  { "tpope/vim-repeat", lazy = false },

  { "vim-test/vim-test", lazy = false },
}
