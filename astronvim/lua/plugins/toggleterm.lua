local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", count = 3 })
local function _lazygit_toggle()
  lazygit:toggle()
end

return {
  "akinsho/toggleterm.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<C-f>"] = { "<cmd>1ToggleTerm direction=float<cr>", desc = "Toggle terminal" },
            ["<C-y>"] = { "<cmd>2ToggleTerm direction=vertical size=90<cr>", desc = "Toggle Claude Code" },
            ["<C-g>"] = { _lazygit_toggle, desc = "Toggle lazygit" },
          },
          t = {
            ["<C-f>"] = { "<cmd>1ToggleTerm<cr>", desc = "Toggle terminal" },
            ["<C-y>"] = { "<cmd>2ToggleTerm<cr>", desc = "Toggle Claude Code" },
            ["<C-g>"] = { _lazygit_toggle, desc = "Toggle lazygit" },
          },
        },
      },
    },
  },
}
