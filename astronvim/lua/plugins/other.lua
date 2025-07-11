return {
  "rgroli/other.nvim",
  lazy = false,
  ft = {
    "rails",
  },
  config = function()
    require("other-nvim").setup {
      mappings = {
        -- built-in mappings
        "rails",
        -- custom mappings
        {
          pattern = "Gemfile$",
          target = "Gemfile.lock",
        },
        {
          pattern = "Gemfile.lock$",
          target = "Gemfile",
        },
      },
      rememberBuffers = false,
    }
  end,
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>o"] = { desc = "Other" },
          ["<Leader>oo"] = { "<cmd>:Other<CR>", desc = "Other same window" },
          ["<Leader>ov"] = { "<cmd>:OtherVSplit<CR>", desc = "Other vertical split" },
          ["<Leader>ot"] = { "<cmd>:OtherTabNew<CR>", desc = "Other new tab" },
        },
      },
    },
  },
}
