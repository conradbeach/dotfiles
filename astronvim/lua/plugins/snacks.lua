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
      exclude = { -- Folder names to exclude from the picker.
        "log",
        "node_modules",
        "tmp",
      },
      formatters = {
        file = {
          truncate = 1000, -- truncate the file path to (roughly) this length
        },
      },
      layout = {
        layout = {
          backdrop = false,
        },
      },
      sources = {
        files = {
          ignored = true, -- Include ignored files.
          hidden = true, -- Include hidden files.
        },
        grep = {
          hidden = true, -- Include hidden files.
          ignored = true, -- Include ignored files.
        },
      },
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
