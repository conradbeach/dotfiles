-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "css",
      "diff",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "regex",
      "ruby",
    },
    indent = { enable = false }, -- I was having some annoying issues with incorrect indentation; turning this off seems to have resolved it.
  },
}
