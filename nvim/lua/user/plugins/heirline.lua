return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astronvim.utils.status")

    -- Modifying `statusline` table: https://github.com/AstroNvim/AstroNvim/blob/main/lua/plugins/heirline.lua#L15
    opts.statusline[3] = status.component.file_info {
      filename = { modify = ":." }, -- Shows full file path relative to working directory.
    }
    opts.statusline[12] = nil -- Remove mode indicator at the end of the status line

    opts.tabline = nil -- Remove tabline; using `akinsho/bufferline.nvim` instead.
    opts.winbar = nil -- Remove winbar; using `utilyre/barbecue.nvim` instead.

    -- Return the final configuration table
    return opts
  end,
}
