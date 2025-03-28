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
      -- add more arguments for adding more treesitter parsers
    },
  },
}
