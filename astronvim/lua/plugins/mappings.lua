-- Utility function for code block yanking
_G.yank_code_with_context = function()
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"
  local line_text = start_line == end_line and ("on line " .. start_line)
    or ("on lines " .. start_line .. " to " .. end_line)

  local file_path = vim.fn.fnamemodify(vim.fn.expand "%", ":.")
  local code = vim.fn.getreg '"'

  local result = string.format("In `%s` %s, we have:\n```\n%s\n```\n", file_path, line_text, code)

  vim.fn.setreg("+", result)
end

-- Utility function for yanking git diff of current file
_G.yank_git_diff = function()
  local file_path = vim.fn.fnamemodify(vim.fn.expand "%", ":.")
  local git_diff = vim.fn.system("git diff " .. vim.fn.shellescape(file_path))

  if vim.v.shell_error == 0 and git_diff ~= "" then
    local result = string.format(
      "In `%s`, we have these changes:\n```diff\n%s```\nPlease evaluate these changes.",
      file_path,
      git_diff
    )
    vim.fn.setreg("+", result)
  else
    print("No git diff found for " .. file_path)
  end
end

-- Utility function for yanking all changes in current file compared to base branch
_G.yank_git_diff_from_base = function()
  local file_path = vim.fn.fnamemodify(vim.fn.expand "%", ":.")

  -- Check for main or master branch
  local base_branch = "main"
  local check = vim.fn.system "git rev-parse --verify main 2>/dev/null"
  if vim.v.shell_error ~= 0 then base_branch = "master" end

  -- Get diff from base branch including all changes (committed and uncommitted)
  local git_diff = vim.fn.system("git diff " .. base_branch .. " " .. vim.fn.shellescape(file_path))

  if vim.v.shell_error == 0 and git_diff ~= "" then
    local result = string.format(
      "In `%s`, we have these changes compared to %s:\n```diff\n%s```\nPlease evaluate these changes.",
      file_path,
      base_branch,
      git_diff
    )
    vim.fn.setreg("+", result)
  else
    print("No git diff found for " .. file_path .. " compared to " .. base_branch)
  end
end

-- Utility function for yanking all uncommitted changes
_G.yank_all_git_diff = function()
  local git_diff = vim.fn.system "git diff"

  if vim.v.shell_error == 0 and git_diff ~= "" then
    local result =
      string.format("We have these uncommitted changes:\n```diff\n%s```\nPlease evaluate these changes.", git_diff)
    vim.fn.setreg("+", result)
  else
    print "No uncommitted changes found"
  end
end

-- Utility function for yanking all changes compared to base branch
_G.yank_all_git_diff_from_base = function()
  -- Check for main or master branch
  local base_branch = "main"
  local check = vim.fn.system "git rev-parse --verify main 2>/dev/null"
  if vim.v.shell_error ~= 0 then base_branch = "master" end

  -- Get diff from base branch including all changes (committed and uncommitted)
  local git_diff = vim.fn.system("git diff " .. base_branch)

  if vim.v.shell_error == 0 and git_diff ~= "" then
    local result = string.format(
      "We have these changes compared to %s:\n```diff\n%s```\nPlease evaluate these changes.",
      base_branch,
      git_diff
    )
    vim.fn.setreg("+", result)
  else
    print("No changes found compared to " .. base_branch)
  end
end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- These tables are a direct conversion to the vim.keymap.set({mode}, {lhs}, {rhs}, {opts}) Lua API.
      -- The first key into the table is the {mode}, the second key into the table is the {lhs}, and the
      -- element there is the {opts} table with the {rhs} in the first key.
      -- Keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        -- first key is the mode
        v = {
          -- second key is the lefthand side of the map
          ["<Leader>y"] = { "", desc = "Yank" },
          ["<Leader>yc"] = { "", desc = "Context" },
          ["<Leader>ycc"] = { "y<cmd>lua yank_code_with_context()<cr>", desc = "Code block" },
        },
        n = {
          -- Remove some mappings I don't want.
          ["<Leader>C"] = false, -- Force close buffer. I don't worry about buffers.
          ["<Leader>h"] = false, -- Home screen. I won't use this.
          ["<Leader>/"] = false, -- Comment toggle. I'd rather just use `gcc`.
          ["<Leader>tp"] = false, -- Remove Python ToggleTerm binding. I will never use this.
          ["<Leader>tv"] = false, -- Remove ToggleTerm vertical split binding. I will never use this.
          ["<Leader>th"] = false, -- Remove ToggleTerm horizontal split binding. I will never use this.

          -- First character bindings
          ["^"] = "0", -- Make the easier "0" key move to the first character in the line.
          ["0"] = "^", -- Set "^" to move to the first column in the line.

          -- Allow moving through wrapped lines.
          ["k"] = "gk",
          ["j"] = "gj",

          -- Move line up or down
          ["[e"] = { "<cmd>m -2<cr>", desc = "Move line up" },
          ["]e"] = { "<cmd>m +1<cr>", desc = "Move line down" },

          -- Yank file paths to clipboard
          ["<Leader>y"] = { "", desc = "Yank" },
          ["<Leader>yc"] = { "", desc = "Context" },
          ["<Leader>ycd"] = { "", desc = "Diff" },
          ["<Leader>ycdb"] = { "", desc = "Compare to base branch" },
          ["<Leader>yf"] = { "<cmd>let @+=expand('%:t')<cr>", desc = "File name" },
          ["<Leader>yp"] = { "<cmd>let @+=expand('%:p')<cr>", desc = "File path" },
          ["<Leader>yr"] = { "<cmd>let @+=fnamemodify(expand('%'), ':.')<cr>", desc = "Relative path" },
          ["<Leader>ycf"] = { "<cmd>let @+='In `' . fnamemodify(expand('%'), ':.') . '`, '<cr>", desc = "File" },
          ["<Leader>ycl"] = {
            "<cmd>let @+='In `' . fnamemodify(expand('%'), ':.') . '` on line ' . line('.') . ', '<cr>",
            desc = "File and line",
          },
          ["<Leader>ycdf"] = { "<cmd>lua yank_git_diff()<cr>", desc = "File" },
          ["<Leader>ycdbf"] = { "<cmd>lua yank_git_diff_from_base()<cr>", desc = "File" },
          ["<Leader>ycda"] = { "<cmd>lua yank_all_git_diff()<cr>", desc = "All files" },
          ["<Leader>ycdba"] = { "<cmd>lua yank_all_git_diff_from_base()<cr>", desc = "All files" },

          -- Panes
          ["<Leader>z"] = { "<cmd>wincmd |<cr>", desc = "Zoom Pane" },

          -- Manipulating tabs
          ["<Leader>n"] = { "", desc = "New" },
          ["<Leader>nt"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
          ["<Leader>nf"] = { "<cmd>enew<cr>", desc = "New File" },
          ["<Leader>c"] = { "", desc = "Close" },
          ["<Leader>ct"] = { "<cmd>tabclose<cr>", desc = "Close Tab" },
          ["<Leader>ce"] = { "<cmd>on<cr><cmd>tabonly<cr>", desc = "Close Everything Else" },
          ["<Leader>co"] = { "", desc = "Close Other" },
          ["<Leader>cot"] = { "<cmd>tabonly<cr>", desc = "Close Other Tabs" },
          ["<Leader>cow"] = { "<cmd>on<cr>", desc = "Close Other Windows" },
          ["[T"] = { "<cmd>tabm -1<cr>", desc = "Move tab left" },
          ["]T"] = { "<cmd>tabm +1<cr>", desc = "Move tab right" },

          -- Navigating tabs
          ["<Leader>1"] = { "1gt", desc = "Go to Tab 1" },
          ["<Leader>2"] = { "2gt", desc = "Go to Tab 2" },
          ["<Leader>3"] = { "3gt", desc = "Go to Tab 3" },
          ["<Leader>4"] = { "4gt", desc = "Go to Tab 4" },
          ["<Leader>5"] = { "5gt", desc = "Go to Tab 5" },
          ["<Leader>6"] = { "6gt", desc = "Go to Tab 6" },
          ["<Leader>7"] = { "7gt", desc = "Go to Tab 7" },
          ["<Leader>8"] = { "8gt", desc = "Go to Tab 8" },
          ["<Leader>9"] = { "9gt", desc = "Go to Tab 9" },
          -- Switch to last active tab configured in polish.lua

          -- Visual Studio Code
          ["<Leader>K"] = { "<cmd>!code %<cr>", desc = "Open File in Visual Studio Code" },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- Go to definition
          ["gd"] = { "", desc = "Show the definition of current symbol", cond = "textDocument/definition" },
          ["gdd"] = {
            "<cmd>lua vim.lsp.buf.definition()<cr>",
            desc = "In current window",
            cond = "textDocument/definition",
          },
          ["gdt"] = {
            "<cmd>tab split | lua vim.lsp.buf.definition()<cr>",
            desc = "In a new tab",
            cond = "textDocument/definition",
          },
          ["gdv"] = {
            "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
            desc = "In a vertical split",
            cond = "textDocument/definition",
          },
          ["gdx"] = {
            "<cmd>split | lua vim.lsp.buf.definition()<cr>",
            desc = "In a horizontal split",
            cond = "textDocument/definition",
          },
        },
      },
    },
  },
}
