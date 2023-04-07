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
    "rmehri01/onenord.nvim",
    config = function()
      require("onenord").setup({
        theme = "light", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        custom_colors = {
          bg = "#FFFFFF",
        },
      })
    end,
  }
}
