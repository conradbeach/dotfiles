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

          -- VSCode
          ["<Leader>K"] = { "<cmd>!code %<cr>", desc = "Open File in VSCode" },

          ------------- Plugins -------------

          -- ggandor/leap.nvim
          ["<Leader>w"] = { "<Plug>(leap-forward-to)", desc = "Leap Forward" },
          ["<Leader>W"] = { "<Plug>(leap-backward-to)", desc = "Leap Backward" },
          ["<Leader>X"] = { "<Plug>(leap-cross-window)", desc = "Leap Across Window" },

          -- nvim-tree/nvim-tree.lua
          ["<Leader>e"] = { "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
          ["<Leader>fe"] = { "<cmd>NvimTreeFindFile<cr>", desc = "Find File in Explorer" },
          ["<Leader>ne"] = { "<cmd>tabnew<cr><cmd>NvimTreeOpen<cr>", desc = "New Tab with Explorer" },

          -- nvim-pack/nvim-spectre
          ["<Leader>fs"] = { "", desc = "Search and Replace" },
          ["<Leader>fsg"] = { "<cmd>lua require('spectre').open()<cr>", desc = "Global Search & Replace" },
          ["<Leader>fsf"] = { "<cmd>lua require('spectre').open_file_search()<cr>", desc = "File Search & Replace" },
          ["<Leader>fsw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Search & Replace Current Word" },

          -- codota/tabnine-nvim
          ["<Leader>a"] = { "", desc = "AI Chat" },
          ["<Leader>ao"] = { "<cmd>TabnineChat<cr>", desc = "Open Tabnine Chat" },
          ["<Leader>ac"] = { "<cmd>TabnineChatClose<cr>", desc = "Close Tabnine Chat" },

          -- nvim-telescope/telescope.nvim
          ["<Leader>fc"] = { "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>", desc = "Find word under cursor" },
          ["<Leader>fi"] = { "", desc = "Find word under cursor in..." },
          ["<Leader>fib"] = { "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor_current_buffer()<cr>", desc = "Find word under cursor in current buffer" },
          ["<Leader>fia"] = { "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({ search_dirs = { 'app' } })<cr>", desc = "Find word under cursor in `app` directory" },
          ["<Leader>fis"] = { "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({ search_dirs = { 'spec' } })<cr>", desc = "Find word under cursor in `spec` directory" },
          ["<Leader>fp"] = {
            function() require("telescope.builtin").find_files { find_command = { "rg", "--files", "--glob", "spec/fixtures/vcr_cassettes/**", "--glob", "**/__snapshots__/**" } } end,
            desc = "Find snapshots",
          },
          ["<Leader>fw"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Find words" },

          -- mbbill/undotree
          ["<Leader>fu"] = { vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },

          -- vim-test/vim-test
          -- Strategy and executable are configured in polish.lua
          ["<Leader>t"] = { "", desc = "Tests" },
          ["<Leader>tn"] = { "<cmd>TestNearest<cr>", desc = "Test Nearest"},
          ["<Leader>tf"] = { "<cmd>TestFile<cr>", desc = "Test File"},
          ["<Leader>ts"] = { "<cmd>TestSuite<cr>", desc = "Test Suite"},
          ["<Leader>tl"] = { "<cmd>TestLast<cr>", desc = "Test Last"},
          ["<Leader>td"] = { "", desc = "Dry Run" },
          ["<Leader>tdn"] = { "<cmd>TestNearest --dry-run<cr>", desc = "Test Nearest Dry Run"},
          ["<Leader>tdf"] = { "<cmd>TestFile --dry-run<cr>", desc = "Test File Dry Run"},
          ["<Leader>tds"] = { "<cmd>TestSuite --dry-run<cr>", desc = "Test Suite Dry Run"},
          ["<Leader>to"] = { "", desc = "Only" },
          ["<Leader>tof"] = { "<cmd>TermExec cmd='bundle exec rspec --only-failures --format=documentation'<cr>", desc = "Test Only Failures"},
          ["<Leader>too"] = { "", desc = "Only One" },
          ["<Leader>toof"] = { '<cmd>TermExec cmd="bundle exec rspec --next-failure --format=documentation"<cr>', desc = "Test Only One Failure"},
        },
        v = {
          ["<Leader>f"] = { "", desc = "Find" },
          ["<leader>fv"] = { "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<cr>", desc = "Find word in visual selection" },
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
