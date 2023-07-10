return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "ruby",
    },
    indent = { enable = false }, -- I was having some annoying issues with incorrect indentation; turning this off seems to have resolved it.
  },
}
