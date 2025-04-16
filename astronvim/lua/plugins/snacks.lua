return {
  "folke/snacks.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            -- The following mappings are provided by AstroNvim but they don't include hidden files which I want.
            ["<Leader>fw"] = {
              function() require("snacks").picker.grep { hidden = true } end, desc = "Find words",
            },
            ["<Leader>fc"] = {
              function() require("snacks").picker.grep_word { hidden = true } end, desc = "Find word under cursor",
            },
            ["<Leader>fo"] = { function() require("snacks").picker.recent { hidden = true } end, desc = "Find old files" },
          },
        },
      },
    },
  },
  opts = {
    dashboard = {
      preset = {
        header = table.concat({
          " █████  ███████ ████████ ██████   ██████ ",
          "██   ██ ██         ██    ██   ██ ██    ██",
          "███████ ███████    ██    ██████  ██    ██",
          "██   ██      ██    ██    ██   ██ ██    ██",
          "██   ██ ███████    ██    ██   ██  ██████ ",
          "",
          "███    ██ ██    ██ ██ ███    ███",
          "████   ██ ██    ██ ██ ████  ████",
          "██ ██  ██ ██    ██ ██ ██ ████ ██",
          "██  ██ ██  ██  ██  ██ ██  ██  ██",
          "██   ████   ████   ██ ██      ██",
          "                                ",
          "       What would Jesus do?     ",
        }, "\n"),
      },
    },
    picker = {
      formatters = {
        file = {
          truncate = 1000, -- truncate the file path to (roughly) this length
        },
      },
      layout = { layout = { backdrop = false } },
      win = {
        input = {
          keys = {
            ["<c-x>"] = { "edit_split", mode = { "i", "n" } }, -- Default is "<c-s>" which conflicts with my tmux leader.
          },
        },
        list = {
          keys = {
            ["<c-x>"] = { "edit_split", mode = { "i", "n" } }, -- Default is "<c-s>" which conflicts with my tmux leader.
          },
        },
      },
    },
  },
}
