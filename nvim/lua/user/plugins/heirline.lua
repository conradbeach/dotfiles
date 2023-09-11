return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require("astronvim.utils.status")

    -- VSCode like winbar
    -- Modified version from AstroNvim docs: https://astronvim.com/Recipes/status#replicate-visual-studio-code-winbar
    opts.winbar = { -- create custom winbar
      -- store the current buffer number
      init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
      fallthrough = false, -- pick the correct winbar based on condition
      -- inactive winbar
      {
        condition = function() return not status.condition.is_active() end,
        -- show the path to the file relative to the working directory
        status.component.separated_path { max_depth = 99, path_func = status.provider.filename { modify = ":.:h" }, separator = "  "  },
        -- add the file name and icon
        status.component.file_info {
          file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
          file_modfied = false,
          file_read_only = false,
          hl = status.hl.get_attributes("winbarnc", true),
          surround = false,
          update = "BufEnter",
        },
      },
      -- active winbar
      {
        -- show the path to the file relative to the working directory
        status.component.separated_path { max_depth = 99, path_func = status.provider.filename { modify = ":.:h" }, separator = "  "  },
        -- add the file name and icon
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
          file_modified = false,
          file_read_only = false,
          hl = status.hl.get_attributes("winbar", true),
          surround = false,
          update = "BufEnter",
        },
      },
    }

    -- Modifying `statusline` table: https://github.com/AstroNvim/AstroNvim/blob/main/lua/plugins/heirline.lua#L15
    opts.statusline[3] = status.component.file_info {
      filename = { modify = ":." }, -- Shows full file path relative to working directory.
    }
    opts.statusline[12] = nil -- Remove mode indicator at the end of the status line

    opts.tabline = nil -- Remove tabline; using `akinsho/bufferline.nvim` instead.

    -- Return the final configuration table
    return opts
  end,
}
