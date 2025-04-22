-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {
  { "max397574/better-escape.nvim", enabled = false },

  {
    "akinsho/bufferline.nvim",
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

  {
    -- Also importing the community config in `community.lua`.
    "m4xshen/hardtime.nvim",
    opts = {
      max_count = 8, -- The default of 3 feels to restrictive.
    }
  },

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

  {
    "akinsho/toggleterm.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<C-f>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
            },
            t = {
              ["<C-f>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
            },
          },
        },
      },
    },
    opts = {
      direction = "float",
    },
  },

  { "tpope/vim-rails", lazy = false },

  { "tpope/vim-surround", lazy = false },

  { "machakann/vim-swap", lazy = false },

  { "tpope/vim-repeat", lazy = false },
}
