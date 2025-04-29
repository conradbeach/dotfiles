-- Also using the community configuration (see `community.lua`).
return {
  "yetone/avante.nvim",
  opts = {
    provider = "claude-haiku",
    claude = {
      disable_tools = true,
    },
    mappings = {
      diff = {
        cursor = "cu", -- The default `cc` conflicts with my mapping to change the current line.
      },
    },
    windows = {
      ask = {
        focus_on_apply = "theirs", -- which diff to focus after applying
        start_insert = false,
      },
      width = 40, -- default % based on available width
    },
  },
  dependencies = {
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "Avante" },
      },
      ft = { "Avante" },
    },
  },
}
