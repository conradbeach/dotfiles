return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.autocmds = vim.tbl_deep_extend("force", opts.autocmds or {}, {
        terminal_links = {
          {
            event = "TermOpen",
            callback = function()
              -- Enable clickable file paths in terminal mode
              vim.keymap.set("n", "<LeftMouse>", function()
                local mouse_pos = vim.fn.getmousepos()
                local win = mouse_pos.winid
                local row = mouse_pos.line
                local col = mouse_pos.column

                -- Switch to the window under cursor
                vim.api.nvim_set_current_win(win)

                -- Get the line content
                local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
                if not line then return end

                -- Pattern to match file paths with optional line numbers
                -- Matches: path/to/file.ext:123:45 or path/to/file.ext:123 or path/to/file.ext
                local patterns = {
                  -- Full path with line and column
                  "([%w%-%._~/]+/[%w%-%._/]+%.%w+):(%d+):(%d+)",
                  -- Path with line number only
                  "([%w%-%._~/]+/[%w%-%._/]+%.%w+):(%d+)",
                  -- Just the file path
                  "([%w%-%._~/]+/[%w%-%._/]+%.%w+)",
                }

                local file, line_num, col_num
                for _, pattern in ipairs(patterns) do
                  local start_pos = 1
                  while true do
                    local match_start, match_end, f, l, c = line:find(pattern, start_pos)
                    if not match_start then break end

                    -- Check if click is within the match
                    if col >= match_start and col <= match_end then
                      file = f
                      line_num = l
                      col_num = c
                      break
                    end

                    start_pos = match_end + 1
                  end
                  if file then break end
                end

                if file then
                  -- Expand ~ to home directory
                  if file:sub(1, 1) == "~" then
                    file = vim.fn.expand(file)
                  end

                  -- Check if file exists
                  if vim.fn.filereadable(file) == 1 then
                    -- Open in a new window or use existing
                    vim.cmd("wincmd p") -- Go to previous window
                    vim.cmd("edit " .. vim.fn.fnameescape(file))

                    -- Jump to line and column if provided
                    if line_num then
                      vim.cmd("normal! " .. line_num .. "G")
                      if col_num then
                        vim.cmd("normal! " .. col_num .. "|")
                      end
                    end
                  else
                    vim.notify("File not found: " .. file, vim.log.levels.WARN)
                  end
                end
              end, { buffer = true })
            end,
          },
        },
      })
    end,
  },
}
