return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Spectre = "󰛔" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>s"
        local current_word_search = function() require("spectre").open_visual { select_word = true } end
        local current_word_desc = "Current Word"

        maps.n[prefix] = { desc = require("astroui").get_icon("Spectre", 1, true) .. "Search and Replace" }
        maps.n[prefix .. "s"] = { function() require("spectre").open() end, desc = "Global" }
        maps.n[prefix .. "f"] = { function() require("spectre").open_file_search() end, desc = "Current File" }
        maps.n[prefix .. "w"] = {
          current_word_search,
          desc = current_word_desc,
        }

        maps.x[prefix] = maps.n[prefix]
        maps.x[prefix .. "w"] = {
          current_word_search,
          desc = current_word_desc,
        }
      end,
    },
  },
  config = function()
    require("spectre").setup {
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = {
            "-i",
            "",
            "-E",
          },
        },
      },
    }
  end,
}
