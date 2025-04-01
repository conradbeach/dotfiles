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
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>w"] = { "<Plug>(leap)", desc = "Leap" },
            ["<Leader>X"] = { "<Plug>(leap-cross-window)", desc = "Leap Across Window" },
          },
        },
      }
    },
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
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>e"] = { "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
              ["<Leader>fe"] = { "<cmd>NvimTreeFindFile<cr>", desc = "Find File in Explorer" },
              ["<Leader>ne"] = { "<cmd>tabnew<cr><cmd>NvimTreeOpen<cr>", desc = "New Tab with Explorer" },
            },
          },
        },
      },
    },
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
