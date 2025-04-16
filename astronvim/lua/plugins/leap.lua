return {
  "ggandor/leap.nvim",
  lazy = false,
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>w"] = { "<Plug>(leap)", desc = "Leap" },
          ["<Leader>X"] = { "<Plug>(leap-cross-window)", desc = "Leap Across Window" },
        },
        x = {
          ["<Leader>w"] = { "<Plug>(leap)", desc = "Leap" },
          ["<Leader>X"] = { "<Plug>(leap-cross-window)", desc = "Leap Across Window" },
        },
        o = {
          ["<Leader>w"] = { "<Plug>(leap)", desc = "Leap" },
          ["<Leader>X"] = { "<Plug>(leap-cross-window)", desc = "Leap Across Window" },
        },
      },
    },
  },
}
