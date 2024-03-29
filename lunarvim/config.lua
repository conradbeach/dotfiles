 -------------------- Options --------------------
lvim.builtin.bufferline.options = {
  mode = "tabs",
  numbers = function(opts)
    return string.format('%s)', opts.ordinal)
  end,
}

vim.opt.wrap = true
vim.opt.relativenumber = true -- set relative numbered lines

-- Folding
vim.opt.foldmethod = "syntax"
-- Remember folds.
vim.cmd("autocmd BufRead * normal zR")
vim.cmd("autocmd BufWinLeave * silent! mkview")
vim.cmd("autocmd BufWinEnter * silent! loadview")

-- Make it obvious where 80 characters is.
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

-- Fix troublesome tab switching behavior. https://github.com/LunarVim/LunarVim/issues/3007
vim.api.nvim_del_augroup_by_name('_auto_resize')


-------------------- Keymappings -------------------- 
-- [view all the defaults by pressing <leader>Lk] 

lvim.leader = "space"

-- Remove some mappings I don't want.
lvim.builtin.which_key.mappings['w'] = {} -- Save. Just use :w.
lvim.builtin.which_key.mappings['q'] = {} -- Quit. Just use :q.
lvim.builtin.which_key.mappings['c'] = {} -- Close buffer. I don't worry about buffers.
lvim.builtin.which_key.mappings['/'] = {} -- Comment toggle. It doesn't take a count, so I'd rather just use `gcc`.

-- 0 goes to the first non-whitespace character.
lvim.keys.normal_mode["0"] = "^"

-- Allow moving through wrapped lines.
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["j"] = "gj"

lvim.builtin.which_key.mappings["nh"] = { "<cmd>noh<cr>", "Clear Search Highlights" }

lvim.builtin.which_key.mappings["z"] = { "<cmd>wincmd _<cr><cmd>wincmd |<cr>", "Zoom Pane" }

lvim.builtin.which_key.mappings["st"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Text" }

-- Move line up or down
lvim.keys.normal_mode["[e"] = "<cmd>m -2<cr>"
lvim.keys.normal_mode["]e"] = "<cmd>m +1<cr>"

-- Manipulating tabs
lvim.builtin.which_key.mappings["nt"] = { "<cmd>tabnew<cr>", "New Tab"}
lvim.builtin.which_key.mappings["ct"] = { "<cmd>tabclose<cr>", "Close Tab"}
lvim.builtin.which_key.mappings["cot"] = { "<cmd>tabonly<cr>", "Close Other Tabs" }
lvim.builtin.which_key.mappings["on"] = { "<cmd>on<cr>", "Close Other Windows"}
lvim.builtin.which_key.mappings["ce"] = { "<cmd>on<cr><cmd>tabonly<cr>", "Close Other Tabs & Windows"}

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


-------------------- LSP, Completion, Linting, etc. -------------------- 
lvim.lsp.automatic_servers_installation = true


-------------------- Plugins -------------------- 
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.plugins = {
  { "dense-analysis/ale" },

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

  -- { "github/copilot.vim" },

  { "roman/golden-ratio" },

  { "ggandor/leap.nvim" },

  {
    "numToStr/Navigator.nvim",
    config = function()
      require('Navigator').setup()
    end
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      })
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({})
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup({
        mapping={
          ['send_to_qf'] = {
              map = "<leader>ssq",
              cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
              desc = "send all item to quickfix"
          },
          ['replace_cmd'] = {
              map = "<leader>ssc",
              cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
              desc = "input replace vim command"
          },
          ['show_option_menu'] = {
              map = "<leader>sso",
              cmd = "<cmd>lua require('spectre').show_options()<CR>",
              desc = "show option"
          },
          ['run_current_replace'] = {
            map = "<leader>ssr",
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "replace current line"
          },
          ['run_replace'] = {
              map = "<leader>ssR",
              cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
              desc = "replace all"
          },
          ['change_view_mode'] = {
              map = "<leader>ssv",
              cmd = "<cmd>lua require('spectre').change_view()<CR>",
              desc = "change result view mode"
          },
          ['resume_last_search'] = {
            map = "<leader>ssl",
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "resume last search before close"
          },
          -- you can put your mapping here it only use normal mode
        },
       })
    end,
  },

  { "kana/vim-textobj-user" },

  { "nelstrom/vim-textobj-rubyblock" },

  { "nvim-treesitter/nvim-treesitter-context" },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file is opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  },

  { "rmehri01/onenord.nvim" },

  { "AndrewRadev/splitjoin.vim" },

  { "nvim-telescope/telescope-live-grep-args.nvim" },

  { "mbbill/undotree" },

  { "tpope/vim-rails" },

  { "tpope/vim-surround" },

  { "machakann/vim-swap" },

  { "tpope/vim-repeat" },

  { "vim-test/vim-test" },

  { "christoomey/vim-tmux-runner" },
}

-- dense-analysis/ale
vim.cmd("let g:ale_sign_column_always = 1")
lvim.keys.normal_mode["]r"] = ":ALENextWrap<cr>"
lvim.keys.normal_mode["[r"] = ":ALEPreviousWrap<cr>"

-- ggandor/leap.nvim
lvim.builtin.which_key.mappings["w"] = { "<Plug>(leap-forward-to)", "Leap Forward" }
lvim.builtin.which_key.mappings["W"] = { "<Plug>(leap-backward-to)", "Leap Backward" }
lvim.builtin.which_key.mappings["xw"] = { "<Plug>(leap-cross-window)", "Leap Across Window" }

-- numToStr/Navigator.nvim
lvim.keys.normal_mode["<C-h>"] = ":NavigatorLeft<cr>"
lvim.keys.normal_mode["<C-l>"] = ":NavigatorRight<cr>"
lvim.keys.normal_mode["<C-k>"] = ":NavigatorUp<cr>"
lvim.keys.normal_mode["<C-j>"] = ":NavigatorDown<cr>"

-- hrsh7th/nvim-cmp
-- Removing these bindings so they're available for Copilot.
lvim.builtin.cmp.mapping["<Tab>"] = {}
lvim.builtin.cmp.mapping["<S-Tab>"] = {}

-- nvim-pack/nvim-spectre
lvim.builtin.which_key.mappings["ss"]= {
  name = "Spectre",
  g = { "<cmd>lua require('spectre').open()<cr>", "Global Search & Replace" },
  f = { "viw:lua require('spectre').open_file_search()<cr>", "File Search & Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search & Replace Current Word" },
}

-- nvim-tree/nvim-tree.lua
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.which_key.mappings["ne"] = { "<cmd>tabnew<cr><cmd>NvimTreeToggle<cr>", "Explorer in New Tab" }

-- nvim-treesitter/nvim-treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "ruby",
}
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.highlight.enable = true

-- folke/persistence.nvim
lvim.builtin.which_key.mappings["S"]= {
  name = "Session",
  r = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- nvim-telescope/telescope.nvim
lvim.builtin.which_key.mappings["sl"] = { "<cmd>Telescope resume<cr>", "Resume" }
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
require("telescope").load_extension("live_grep_args")

-- mbbill/undotree
lvim.builtin.which_key.mappings["u"] = { vim.cmd.UndotreeToggle, "Toggle Undotree" }

-- christoomey/vim-tmux-runner
vim.g.VtrPercentage = 20
vim.g.VtrOrientation = 'v'
lvim.builtin.which_key.mappings["r"] = {
  name = "Tmux Runner",
  o = { "<cmd>VtrOpenRunner<cr>", "Open Runner"},
  a = { "<cmd>VtrAttachToPane<cr>", "Attach to Runner"},
  f = { "<cmd>VtrFocusRunner<cr>", "Focus Runner"},
  k = { "<cmd>VtrKillRunner<cr>", "Kill Runner"},
  d = { "<cmd>VtrDetachRunner<cr>", "Detach Runner"},
  r = { "<cmd>VtrReattachRunner<cr>", "Reattach Runner"},
  c = { "<cmd>VtrClearRunner<cr>", "Clear Runner"},
  l = { "<cmd>VtrSendCommandToRunner !!<cr>", "Unknown Runner Command"},
  s = {
    name = "Send",
    l = { "<cmd>VtrSendLinesToRunner<cr>", "Send Lines to Runner"},
    d = { "<cmd>VtrSendCtrlD<cr>", "Send Ctrl-D to Runner"},
    k = { "<cmd>VtrSendCommandToRunner !!!<cr>", "Send Kill to Runner"},
    f = { "<cmd>VtrSendFile<cr>", "Send File to Runner"},
  },
}

-- janko-m/vim-test
vim.cmd("let test#strategy = 'vtr'")
vim.cmd("let test#ruby#rspec#executable = 'bundle exec spring rspec --format=documentation'")
lvim.builtin.which_key.mappings["t"] = {
  name = "Test Runner",
  n = { "<cmd>TestNearest<cr>", "Test Nearest"},
  f = { "<cmd>TestFile<cr>", "Test File"},
  s = { "<cmd>TestSuite<cr>", "Test Suite"},
  l = { "<cmd>TestLast<cr>", "Test Last"},
  v = { "<cmd>TestVisit<cr>", "Test Visit"},
  of = { "<cmd>VtrSendCommandToRunner clear; echo -e 'bundle exec spring rspec --only-failures --format=documentation'; bundle exec spring rspec --only-failures --format=documentation<cr>", "Test Only Failures"},
  oof = { "<cmd>VtrSendCommandToRunner clear; echo -e 'bundle exec spring rspec --next-failure --format=documentation'; bundle exec spring rspec --next-failure --format=documentation<cr>", "Test Only One Failure"},
}


-------------------- Theme -------------------- 
lvim.colorscheme = "onenord"
require("onenord").setup({
  theme = "light", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  custom_colors = {
    bg = "#FFFFFF",
  },
})

-- lualine
lvim.builtin.lualine.sections.lualine_c = {
  {
    "filename",
    path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
  }
}
lvim.builtin.lualine.sections.lualine_x = { "diagnostics" }
lvim.builtin.lualine.sections.lualine_y = { "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "location" }
