return {
  "folke/snacks.nvim",
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
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fu"] = { function() require("snacks").picker.undo() end, desc = "Undo history" },
          },
        },
      },
    },
  },
}
