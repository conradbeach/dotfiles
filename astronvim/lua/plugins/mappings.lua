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
        n = {
          -- second key is the lefthand side of the map

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
          ["<Leader>yf"] = { "<cmd>let @+=expand('%:t')<cr>", desc = "File name" },
          ["<Leader>yp"] = { "<cmd>let @+=expand('%:p')<cr>", desc = "File path" },
          ["<Leader>yr"] = { "<cmd>let @+=expand('%')<cr>", desc = "Relative path" },

          -- Panes
          ["<Leader>z"] = { "<cmd>wincmd |<cr>", desc = "Zoom Pane" },

          -- Manipulating tabs
          ["<Leader>n"] = { "", desc = "New" },
          ["<Leader>nt"] = { "<cmd>tabnew<cr>", desc = "New Tab"},
          ["<Leader>nf"] = { "<cmd>enew<cr>", desc = "New File" },
          ["<Leader>c"] = { "", desc = "Close" },
          ["<Leader>ct"] = { "<cmd>tabclose<cr>", desc = "Close Tab"},
          ["<Leader>ce"] = { "<cmd>on<cr><cmd>tabonly<cr>", desc = "Close Everything Else"},
          ["<Leader>co"] = { "", desc = "Close Other" },
          ["<Leader>cot"] = { "<cmd>tabonly<cr>", desc = "Close Other Tabs" },
          ["<Leader>cow"] = { "<cmd>on<cr>", desc = "Close Other Windows"},
          ["[T"] = { "<cmd>tabm -1<cr>", desc = "Move tab left"},
          ["]T"] = { "<cmd>tabm +1<cr>", desc = "Move tab right"},

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

          -- Terminal
          ["<C-f>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

          -- Windsurf
          ["<Leader>K"] = { "<cmd>!windsurf %<cr>", desc = "Open File in Windsurf" },
        },
        t = {
          ["<C-f>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
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
          ["gd"] = { "", desc = "Show the definition of current symbol", cond = "textDocument/definition", },
          ["gdd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "In current window", cond = "textDocument/definition", },
          ["gdt"] = { "<cmd>tab split | lua vim.lsp.buf.definition()<cr>", desc = "In a new tab", cond = "textDocument/definition", },
          ["gdv"] = { "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", desc = "In a vertical split", cond = "textDocument/definition", },
          ["gdx"] = { "<cmd>split | lua vim.lsp.buf.definition()<cr>", desc = "In a horizontal split", cond = "textDocument/definition", },
        }
      },
    },
  },
}
