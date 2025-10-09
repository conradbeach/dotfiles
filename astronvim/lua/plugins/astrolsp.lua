-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    config = {
      ruby_lsp = {
        cmd = {
          "ruby-lsp",
        }
      }
    },
    formatting = {
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
      },
    },
  },
}
