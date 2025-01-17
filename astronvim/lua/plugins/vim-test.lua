return {
  -- Strategy and executable are configured in polish.lua
  "vim-test/vim-test",
  lazy = false,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>t"] = { "", desc = "Tests" },
            ["<Leader>tn"] = { "<cmd>TestNearest<cr>", desc = "Test Nearest"},
            ["<Leader>tf"] = { "<cmd>TestFile<cr>", desc = "Test File"},
            ["<Leader>ts"] = { "<cmd>TestSuite<cr>", desc = "Test Suite"},
            ["<Leader>tl"] = { "<cmd>TestLast<cr>", desc = "Test Last"},
            ["<Leader>td"] = { "", desc = "Dry Run" },
            ["<Leader>tdn"] = { "<cmd>TestNearest --dry-run<cr>", desc = "Test Nearest Dry Run"},
            ["<Leader>tdf"] = { "<cmd>TestFile --dry-run<cr>", desc = "Test File Dry Run"},
            ["<Leader>tds"] = { "<cmd>TestSuite --dry-run<cr>", desc = "Test Suite Dry Run"},
            ["<Leader>to"] = { "", desc = "Only" },
            ["<Leader>tof"] = { "<cmd>TestSuite --only-failures<cr>", desc = "Test Only Failures"},
            ["<Leader>too"] = { "", desc = "Only One" },
            ["<Leader>toof"] = { '<cmd>TestSuite --next-failure<cr>', desc = "Test Only One Failure"},
          },
        },
      },
    },
  },
}
