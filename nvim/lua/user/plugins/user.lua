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

  { "roman/golden-ratio", lazy = false },

  { "ggandor/leap.nvim", lazy = false },

  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup({
        mapping={
          ['send_to_qf'] = {
              map = "<leader>fsq",
              cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
              desc = "send all item to quickfix"
          },
          ['replace_cmd'] = {
              map = "<leader>fsc",
              cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
              desc = "input replace vim command"
          },
          ['show_option_menu'] = {
              map = "<leader>fso",
              cmd = "<cmd>lua require('spectre').show_options()<CR>",
              desc = "show option"
          },
          ['run_current_replace'] = {
            map = "<leader>fsr",
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "replace current line"
          },
          ['run_replace'] = {
              map = "<leader>fsR",
              cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
              desc = "replace all"
          },
          ['change_view_mode'] = {
              map = "<leader>fsv",
              cmd = "<cmd>lua require('spectre').change_view()<CR>",
              desc = "change result view mode"
          },
          ['resume_last_search'] = {
            map = "<leader>fsl",
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "resume last search before close"
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
