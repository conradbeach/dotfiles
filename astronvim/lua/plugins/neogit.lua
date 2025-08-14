return {
  "NeogitOrg/neogit",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "folke/snacks.nvim",             -- optional
    {
      "AstroNvim/astroui",
      opts = {
        icons = { Neogit = "󰰔" },
      },
    },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>g"

        maps.n[prefix .. "g"] = {
          function() require('neogit').open({ kind = "floating" }) end,
          desc = require("astroui").get_icon("Neogit", 1, true) .. "Neogit",
        }
      end
    },
  },
}
