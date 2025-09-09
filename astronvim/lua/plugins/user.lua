-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {
  {
    "bloznelis/before.nvim",
    event = { "InsertEnter", "TextChanged" },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["]c"] = { function() require("before").jump_to_next_edit() end, desc = "Next edit" },
              ["[c"] = { function() require("before").jump_to_last_edit() end, desc = "Previous edit" },
            },
          },
        },
      },
    },
    opts = {},
  },

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

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = nil,
            accept_word = "<C-o>",
            accept_line = "<C-l>",
          },
        }
      })
    end,
  },

  { "glacambre/firenvim", build = ":call firenvim#install(0)" },

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
        }
      }
    end,
  },

  {
    "Wansmer/treesj",
    event = "BufEnter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["gS"] = {
                function() require('treesj').toggle() end,
                desc = "Split or join",
              },
            },
          },
        },
      },
    },
    config = function()
      require("treesj").setup({
        max_join_length = 999, -- Effectively disable line length limit.
        use_default_keymaps = false, -- It has a <space>s mapping that conflicts with my mappings.
      })
    end,
  },


  { "machakann/vim-swap", lazy = false },
}
