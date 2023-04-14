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

  { "roman/golden-ratio", lazy = false },

  { "ggandor/leap.nvim", lazy = false },

  { "nvim-treesitter/nvim-treesitter-context", lazy = false },

  {
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup({
        theme = "light", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        custom_colors = {
          bg = "#FFFFFF",
        },
      })
    end,
  },

  { "AndrewRadev/splitjoin.vim", lazy = false },

  { "nvim-telescope/telescope-live-grep-args.nvim" },

  { "mbbill/undotree", lazy = false },

  { "tpope/vim-rails", lazy = false },

  { "tpope/vim-surround", lazy = false },

  { "machakann/vim-swap", lazy = false },

  { "tpope/vim-repeat", lazy = false },

  { "vim-test/vim-test", lazy = false },
}
