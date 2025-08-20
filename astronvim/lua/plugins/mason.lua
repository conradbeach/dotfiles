-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        "css-lsp",
        "herb-language-server",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "ruby-lsp",
        "selene",
        "stimulus-language-server",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
      },
    },
  },
}
