-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<leader>bD"] = {
      -- function()
        -- require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      -- end,
      -- desc = "Pick to close",
    -- },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Remove some mappings I don't want.
    ["<leader>c"] = false, -- Close buffer. I don't worry about buffers.
    ["<leader>C"] = false, -- Force close buffer. I don't worry about buffers.
    ["<leader>h"] = false, -- Home screen. I won't use this.
    ["<leader>n"] = false, -- New file. I have a different flow.
    ["<leader>q"] = false, -- Quit. Just use :q.
    ["<leader>/"] = false, -- Comment toggle. It doesn't take a count, so I'd rather just use `gcc`.
    ["<leader>tp"] = false, -- Remove Python ToggleTerm binding. I will never use this.

    -- First character bindings
    ["^"] = "0", -- Make the easier "0" key move to the first character in the line.
    ["0"] = "^", -- Set "^" to move to the first column in the line.

    -- Move line up or down
    ["[e"] = "<cmd>m -2<cr>",
    ["]e"] = "<cmd>m +1<cr>",

    -- Panes
    ["<leader>z"] = { "<cmd>wincmd |<cr>", desc = "Zoom Pane" },

    -- Manipulating tabs
    ["<leader>nt"] = { "<cmd>tabnew<cr>", desc = "New Tab"},
    ["<leader>ne"] = { "<cmd>tabnew<cr><cmd>Neotree<cr>", desc = "Explorer in New Tab" },
    ["<leader>ct"] = { "<cmd>tabclose<cr>", desc = "Close Tab"},
    ["<leader>cot"] = { "<cmd>tabonly<cr>", desc = "Close Other Tabs" },
    ["<leader>on"] = { "<cmd>on<cr>", desc = "Close Other Windows"},
    ["<leader>ce"] = { "<cmd>on<cr><cmd>tabonly<cr>", desc = "Close Other Tabs & Windows"},

    -- Navigating tabs
    ["<leader>1"] = { "1gt", desc = "Go to Tab 1" },
    ["<leader>2"] = { "2gt", desc = "Go to Tab 2" },
    ["<leader>3"] = { "3gt", desc = "Go to Tab 3" },
    ["<leader>4"] = { "4gt", desc = "Go to Tab 4" },
    ["<leader>5"] = { "5gt", desc = "Go to Tab 5" },
    ["<leader>6"] = { "6gt", desc = "Go to Tab 6" },
    ["<leader>7"] = { "7gt", desc = "Go to Tab 7" },
    ["<leader>8"] = { "8gt", desc = "Go to Tab 8" },
    ["<leader>9"] = { "9gt", desc = "Go to Tab 9" },
    -- Switch to last active tab configured in init.lua

    -- Terminal
    ["<C-n>"] = { "<cmd>ToggleTerm<cr>" },

    ------------- Plugins -------------

    -- ggandor/leap.nvim
    ["<leader>w"] = { "<Plug>(leap-forward-to)", desc = "Leap Forward" },
    ["<leader>W"] = { "<Plug>(leap-backward-to)", desc = "Leap Backward" },
    ["<leader>xw"] = { "<Plug>(leap-cross-window)", desc = "Leap Across Window" },

    -- nvim-pack/nvim-spectre
    ["<leader>fs"] = {
      name = "Search and Replace",
      g = { "<cmd>lua require('spectre').open()<cr>", "Global Search & Replace" },
      f = { "viw<cmd>lua require('spectre').open_file_search()<cr>", "File Search & Replace" },
      w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search & Replace Current Word" },
    },

    -- nvim-telescope/telescope.nvim
    ["<leader>fw"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Find words" },

    -- mbbill/undotree
    ["<leader>fu"] = { vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },

    -- vim-test/vim-test
    -- Strategy and other executables are configured in init.lua
    ["<leader>t"] = {
      name = "Test Runner",
      n = { "<cmd>TestNearest<cr>", "Test Nearest"},
      f = { "<cmd>TestFile<cr>", "Test File"},
      s = { "<cmd>TestSuite<cr>", "Test Suite"},
      l = { "<cmd>TestLast<cr>", "Test Last"},
      of = { '<cmd>TermExec cmd="bundle exec spring rspec --only-failures --format=documentation"<cr>', "Test Only Failures"},
      oof = { '<cmd>TermExec cmd="bundle exec spring rspec --next-failure --format=documentation"<cr>', "Test Only One Failure"},
    }
  },
  t = {
    ["<C-n>"] = { "<cmd>ToggleTerm<cr>" },
  },
}
