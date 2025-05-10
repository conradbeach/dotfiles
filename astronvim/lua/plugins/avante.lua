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
}
