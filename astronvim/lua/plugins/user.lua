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

  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {
        execution_message = {
          message = "",
        },
      }
    end,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
      claude = {
        model = "claude-3-5-haiku-latest",
        -- model = "claude-3-5-sonnet-latest",
      },
      mappings = {
        diff = {
          cursor = "cu", -- The default `cc` conflicts with my mapping to change the current line.
        },
      },
      windows = {
        width = 40, -- default % based on available width
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "HakonHarnes/img-clip.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
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
      notify = { enabled = false }, -- Astronvim already handles this.
      messages = {
        view_search = false, -- I think I might like this, but it was buggy when I first tried it. Set to "virtualtext" to re-enable.
      },
      lsp = {
        signature = { enabled = false }, -- This was causing a conflict.
        hover = { enabled = false }, -- This was causing a conflict.
      },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
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

  {
    "codota/tabnine-nvim",
    lazy = false,
    build = "./dl_binaries.sh",
    config = function() require("tabnine").setup {} end,
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
