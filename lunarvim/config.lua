--[[
lvim is the global options object

Linters should be filled in as strings with either a global executable or a path to an executable
]]

-- # Options
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.bufferline.options = {
  mode = "tabs",
  numbers = function(opts)
    return string.format('%s)', opts.ordinal)
  end,
}

-- Make it obvious where 80 characters is.
vim.opt["textwidth"] = 80
vim.opt["colorcolumn"] = "+1"

-- # Keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- 0 goes to the first non-whitespace character.
lvim.keys.normal_mode["0"] = "^"

-- Allow moving through wrapped lines.
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["j"] = "gj"

lvim.builtin.which_key.mappings["nh"] = { "<cmd>noh<cr>", "Clear Search Highlights" }

lvim.builtin.which_key.mappings["z"] = { "<cmd>wincmd _<cr><cmd>wincmd |<cr>", "Zoom Pane" }

lvim.builtin.which_key.mappings["t"] = {
  name = "Tabs",
  n = { "<cmd>tabnew<cr>", "New Tab"},
  c = { "<cmd>tabclose<cr>", "Close Tab"},
  C = { "<cmd>tabonly<cr>", "Close Other Tabs"},
  W = { "<cmd>on<cr>", "Close Other Windows"},
  E = { "<cmd>on<cr><cmd>tabonly<cr>", "Close Other Tabs & Windows"},
}
-- Navigating tabs
lvim.builtin.which_key.mappings["h"] = { "gT", "Previous Tab" }
lvim.builtin.which_key.mappings["l"] = { "gt", "Next Tab" }
lvim.builtin.which_key.mappings["1"] = { "1gt", "Go to Tab 1" }
lvim.builtin.which_key.mappings["2"] = { "2gt", "Go to Tab 2" }
lvim.builtin.which_key.mappings["3"] = { "3gt", "Go to Tab 3" }
lvim.builtin.which_key.mappings["4"] = { "4gt", "Go to Tab 4" }
lvim.builtin.which_key.mappings["5"] = { "5gt", "Go to Tab 5" }
lvim.builtin.which_key.mappings["6"] = { "6gt", "Go to Tab 6" }
lvim.builtin.which_key.mappings["7"] = { "7gt", "Go to Tab 7" }
lvim.builtin.which_key.mappings["8"] = { "8gt", "Go to Tab 8" }
lvim.builtin.which_key.mappings["9"] = { "9gt", "Go to Tab 9" }
-- Switch to last active tab.
vim.api.nvim_create_autocmd("TabLeave",  {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_keymap('n', '<Leader>0', '<cmd>tabn ' .. vim.api.nvim_tabpage_get_number(0) .. '<CR>', { noremap = true, silent = true })
    end
})


-- # Additional Plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.plugins = {
  {
    "Pocco81/auto-save.nvim",
    config = function()
       require("auto-save").setup {
          execution_message = {
            message = ""
          },
       }
    end,
  },
  {
    "numToStr/Navigator.nvim",
    config = function()
      require('Navigator').setup()
    end
  },
  { "rmehri01/onenord.nvim" },
}


-- ## Navigator.nvim
lvim.keys.normal_mode["<C-h>"] = ":NavigatorLeft<cr>"
lvim.keys.normal_mode["<C-l>"] = ":NavigatorRight<cr>"
lvim.keys.normal_mode["<C-k>"] = ":NavigatorUp<cr>"
lvim.keys.normal_mode["<C-j>"] = ":NavigatorDown<cr>"


-- ## Telescope.nvim
lvim.builtin.which_key.mappings["sl"] = {
  "<cmd>Telescope resume<cr>", "Resume"
}

lvim.builtin.telescope.defaults.path_display = { "truncate" }

-- I didn't like the default configuration for the below pickers so I copied the
-- default configuration from LunarVim [1] and removed the settings I didn't like.
-- [1]: https://github.com/LunarVim/LunarVim/blob/1.2.0/lua/lvim/core/telescope.lua
lvim.builtin.telescope.pickers.find_files = {
  hidden = true,
}
lvim.builtin.telescope.pickers.git_files = {
  hidden = true,
  show_untracked = true,
}
lvim.builtin.telescope.pickers.live_grep = {
  only_sort_text = true, -- don't include the filename in the search results
}


-- ## Treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "ruby",
  "yaml",
}

lvim.builtin.treesitter.highlight.enable = true


-- # Theme
lvim.colorscheme = "onenord"
require("onenord").setup({
  theme = "light", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
})

-- ## lualine
lvim.builtin.lualine.sections.lualine_c = {
  {
    "filename",
    path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
  }
}
lvim.builtin.lualine.sections.lualine_x = { "diagnostics" }
lvim.builtin.lualine.sections.lualine_y = { "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "location" }
