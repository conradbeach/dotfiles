return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Spectre = "󰛔" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>s"
        maps.n[prefix] = { desc = require("astroui").get_icon("Spectre", 1, true) .. "Search and Replace" }
        maps.n[prefix .. "s"] = {
          function() require("spectre").open() end,
          desc = "Global",
        }
        maps.n[prefix .. "f"] = {
          function() require("spectre").open_file_search() end,
          desc = "Current File",
        }
        maps.n[prefix .. "w"] = {
          function() require("spectre").open_visual({ select_word = true }) end,
          desc = "Current Word",
        }
        maps.n[prefix .. "i"] = {
          function() require("spectre").open_file_search({ select_word = true }) end,
          desc = "Current Word in File",
        }
        maps.n[prefix .. "n"] = { desc = "Non-Spec Files" }
        maps.n[prefix .. "nn"] = {
          function() require("spectre").open({ path = "!spec" }) end,
          desc = "Non-Spec Files",
        }
        maps.n[prefix .. "nw"] = {
          function() require("spectre").open_visual({ select_word = true, path = "!spec" }) end,
          desc = "Current Word in Non-Spec Files",
        }
      end,
    },
  },
  config = function()
    require("spectre").setup {}
  end,
}
