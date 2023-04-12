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
    ["<leader>n"] = false, -- New file. I have a different flow.
    ["<leader>q"] = false, -- Quit. Just use :q.
    ["<leader>w"] = false, -- Save. Just use :w.
    ["<leader>/"] = false, -- Comment toggle. It doesn't take a count, so I'd rather just use `gcc`.

    -- First character bindings
    ["^"] = "0", -- Make the easier "0" key move to the first character in the line.
    ["0"] = "^", -- Set "^" to move to the first column in the line.

    -- Move line up or down
    ["[e"] = ":m -2<cr>",
    ["]e"] = ":m +1<cr>",

    -- Searching for text
    ["<leader>ft"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Text" },
    ["<leader>fw"] = false,

    -- Panes
    ["<leader>z"] = { ":wincmd |<cr>", desc = "Zoom Pane" },

    -- Manipulating tabs
    ["<leader>nt"] = { "<cmd>tabnew<cr>", desc = "New Tab"},
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
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
