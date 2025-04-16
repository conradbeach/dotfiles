return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = { "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
            ["<Leader>fe"] = { "<cmd>NvimTreeFindFile<cr>", desc = "Find File in Explorer" },
            ["<Leader>ne"] = { "<cmd>tabnew<cr><cmd>NvimTreeOpen<cr>", desc = "New Tab with Explorer" },
          },
        },
      },
    },
  },
  lazy = false,
  config = function()
    require("nvim-tree").setup {
      view = {
        width = {
          min = 30,
          max = 60,
        },
      },
    }
  end,
}
