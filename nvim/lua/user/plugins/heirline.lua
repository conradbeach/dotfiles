return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astronvim.utils.status")

    opts.statusline[3] = status.component.file_info {
      filename = { modify = ":." },
    }

    opts.tabline = nil -- remove tabline

    -- return the final configuration table
    return opts
  end,
}
