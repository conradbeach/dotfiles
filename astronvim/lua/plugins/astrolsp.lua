-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    formatting = {
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
      },
    },
    mappings = {
      n = {
        -- Go to definition
        ["gd"] = { "", desc = "Show the definition of current symbol", cond = "textDocument/definition", },
        ["gdd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "In current window", cond = "textDocument/definition", },
        ["gdt"] = { "<cmd>tab split | lua vim.lsp.buf.definition()<cr>", desc = "In a new tab", cond = "textDocument/definition", },
        ["gdv"] = { "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", desc = "In a vertical split", cond = "textDocument/definition", },
        ["gdx"] = { "<cmd>split | lua vim.lsp.buf.definition()<cr>", desc = "In a horizontal split", cond = "textDocument/definition", },
      }
    },
  },
}
