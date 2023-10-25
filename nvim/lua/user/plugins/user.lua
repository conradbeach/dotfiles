return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  {
    "dense-analysis/ale",
    lazy = false,
    -- Linters are configured in init.lua
  },

  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
       require("auto-save").setup {
          execution_message = {
            message = ""
          },
       }
    end,
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
       require("bufferline").setup({
          options = {
            mode = "tabs",
            numbers = function(opts)
              return string.format('%s)', opts.ordinal)
            end,
          },
       })
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          keymap = {
            open = "<M-l>"
          },
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            accept_word = "<C-o>",
          },
        },
      })
    end,
  },

  { "mattn/emmet-vim", lazy = false },

  { "roman/golden-ratio", lazy = false },

  { "ggandor/leap.nvim", lazy = false },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons", -- optional
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        view = {
          width = {
            min = 30,
            max = 60,
          },
        },
      })
    end,
  },

  { "nvim-treesitter/nvim-treesitter-context", lazy = false },

  {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup({
        custom_colors = {
          bg = "#FFFFFF",
        },
      })
    end,
  },

  { "AndrewRadev/splitjoin.vim", lazy = false },

  { "nvim-telescope/telescope-live-grep-args.nvim" },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  { "mbbill/undotree", lazy = false },

  { "tpope/vim-rails", lazy = false },

  { "tpope/vim-surround", lazy = false },

  { "machakann/vim-swap", lazy = false },

  { "tpope/vim-repeat", lazy = false },

  { "vim-test/vim-test", lazy = false },
}
