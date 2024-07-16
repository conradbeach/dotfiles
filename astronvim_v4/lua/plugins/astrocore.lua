-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        colorcolumn = "+1", -- Make it obvious where 80 characters is.
        scrolloff = 8, -- number of lines to keep above and below the cursor
        sidescrolloff = 8, -- number of columns to keep at the sides of the cursor
        relativenumber = false,
        textwidth = 80, -- Make it obvious where 80 characters is.
        wrap = true, -- sets vim.opt.wrap
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- Remove some mappings I don't want.
        ["<Leader>c"] = false, -- Close buffer. I don't worry about buffers.
        ["<Leader>C"] = false, -- Force close buffer. I don't worry about buffers.
        ["<Leader>h"] = false, -- Home screen. I won't use this.
        ["<Leader>n"] = false, -- New file. I have a different flow.
        ["<Leader>q"] = false, -- Quit. Just use :q.
        ["<Leader>/"] = false, -- Comment toggle. It doesn't take a count, so I'd rather just use `gcc`.
        ["<Leader>tp"] = false, -- Remove Python ToggleTerm binding. I will never use this.

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
        ["<Leader>y"] = {
          desc = "Yank",
          f = { "<cmd>let @+=expand('%:t')<cr>", "File name" },
          p = { "<cmd>let @+=expand('%:p')<cr>", "File path" },
          r = { "<cmd>let @+=expand('%')<cr>", "Relative path" },
        },

        -- Panes
        ["<Leader>z"] = { "<cmd>wincmd |<cr>", desc = "Zoom Pane" },

        -- Manipulating tabs
        ["<Leader>nt"] = { "<cmd>tabnew<cr>", desc = "New Tab"},
        ["<Leader>nf"] = { "<cmd>enew<cr>", desc = "New File" },
        ["<Leader>ct"] = { "<cmd>tabclose<cr>", desc = "Close Tab"},
        ["<Leader>cot"] = { "<cmd>tabonly<cr>", desc = "Close Other Tabs" },
        ["<Leader>on"] = { "<cmd>on<cr>", desc = "Close Other Windows"},
        ["<Leader>ce"] = { "<cmd>on<cr><cmd>tabonly<cr>", desc = "Close Other Tabs & Windows"},

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
        -- Switch to last active tab configured in init.lua

        -- Terminal
        ["<C-f>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

        -- VSCode
        ["<Leader>K"] = { "<cmd>!code %<cr>", desc = "Open File in VSCode" },

        ------------- Plugins -------------

        -- CopilotChat.nvim
        ["<Leader>a"] = {
          desc = "Copilot Chat",
          -- Toggle Copilot Chat
          v = { "<cmd>CopilotChatToggle<cr>", "Toggle" },
          -- Code related commands
          e = { "<cmd>CopilotChatExplain<cr>", "Explain code" },
          t = { "<cmd>CopilotChatTests<cr>", "Generate tests" },
          r = { "<cmd>CopilotChatReview<cr>", "Review code" },
          R = { "<cmd>CopilotChatRefactor<cr>", "Refactor code" },
          n = { "<cmd>CopilotChatBetterNaming<cr>", "Better Naming" },
          -- Fix the issue with diagnostic
          f = { "<cmd>CopilotChatFixDiagnostic<cr>", "Fix Diagnostic" },
          -- Clear buffer and chat history
          l = { "<cmd>CopilotChatReset<cr>", "Clear buffer and chat history" },
          -- Debug
          d = { "<cmd>CopilotChatDebugInfo<cr>", "Debug Info" },
        },

        -- ggandor/leap.nvim
        ["<Leader>w"] = { "<Plug>(leap-forward-to)", desc = "Leap Forward" },
        ["<Leader>W"] = { "<Plug>(leap-backward-to)", desc = "Leap Backward" },
        ["<Leader>xw"] = { "<Plug>(leap-cross-window)", desc = "Leap Across Window" },

        -- nvim-tree/nvim-tree.lua
        ["<Leader>e"] = { "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
        ["<Leader>fe"] = { "<cmd>NvimTreeFindFile<cr>", desc = "Find File in Explorer" },
        ["<Leader>ne"] = { "<cmd>tabnew<cr><cmd>NvimTreeOpen<cr>", desc = "Explorer in New Tab" },

        -- nvim-pack/nvim-spectre
        ["<Leader>fs"] = {
          desc = "Search and Replace",
          g = { "<cmd>lua require('spectre').open()<cr>", "Global Search & Replace" },
          f = { "viw<cmd>lua require('spectre').open_file_search()<cr>", "File Search & Replace" },
          w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search & Replace Current Word" },
        },

        -- codota/tabnine-nvim
        ["<Leader>aa"] = { ":TabnineChat<cr>", desc = "Open Tabnine Chat" },
        ["<Leader>ac"] = { ":TabnineChatClose<cr>", desc = "Close Tabnine Chat" },

        -- nvim-telescope/telescope.nvim
        ["<Leader>fc"] = { "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>", desc = "Find word under cursor" },
        ["<Leader>fp"] = {
          function() require("telescope.builtin").find_files { find_command = { "rg", "--files", "--glob", "spec/fixtures/vcr_cassettes/**", "--glob", "**/__snapshots__/**" } } end,
          desc = "Find snapshots",
        },
        ["<Leader>fw"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Find words" },

        -- mbbill/undotree
        ["<Leader>fu"] = { vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },

        -- vim-test/vim-test
        -- Strategy and other executables are configured in polish.lua
        ["<Leader>t"] = {
          desc = "Tests",
          n = { "<cmd>TestNearest<cr>", "Test Nearest"},
          f = { "<cmd>TestFile<cr>", "Test File"},
          s = { "<cmd>TestSuite<cr>", "Test Suite"},
          l = { "<cmd>TestLast<cr>", "Test Last"},
          d = {
            desc = "Dry Run",
            n = { "<cmd>TestNearest --dry-run<cr>", "Test Nearest Dry Run"},
            f = { "<cmd>TestFile --dry-run<cr>", "Test File Dry Run"},
            s = { "<cmd>TestSuite --dry-run<cr>", "Test Suite Dry Run"},
          },
          o = {
            desc = "Only",
            f = { '<cmd>TermExec cmd="bundle exec rspec --only-failures --format=documentation"<cr>', "Test Only Failures"},
            o = {
              desc = "Only One",
              f = { '<cmd>TermExec cmd="bundle exec rspec --next-failure --format=documentation"<cr>', "Test Only One Failure"},
            },
          }
        }
      },
      t = {
        ["<C-f>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      },
    },
  },
}
