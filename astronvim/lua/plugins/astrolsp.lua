-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable-next-line: missing-fields
    config = {
      -- Based on https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/harper/init.lua
      harper_ls = {
        settings = {
          ["harper-ls"] = {
            userDictPath = "~/development/dotfiles/harper-ls/dictionary.txt",
            fileDictPath = "~/development/dotfiles/harper-ls/",
            codeActions = {
              forceStable = true,
            },
            linters = {
              linking_verbs = true,
              sentence_capitalization = false,
            },
          },
        },
      },
    },
    formatting = {
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
      },
    },
  },
}
