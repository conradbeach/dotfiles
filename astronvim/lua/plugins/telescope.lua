return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
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
          },
          v = {
            ["<Leader>f"] = { "", desc = "Find" },
            ["<leader>fv"] = { "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<cr>", desc = "Find word in visual selection" },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"

    opts.defaults.mappings.i = {
      ["<C-j>"] = actions.cycle_history_next,
      ["<C-k>"] = actions.cycle_history_prev,
      ["<C-n>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,
    }

    opts.defaults.vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    }

    opts.pickers = {
      find_files = {
        -- `hidden = true` will still show files inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*", "--glob", "!spec/fixtures/vcr_cassettes", "--glob", "!__snapshots__" },
      },
    }

    opts.extensions = {
      live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ["<C-f>"] = require("telescope-live-grep-args.actions").quote_prompt(),
          },
        },
      },
    }

    return opts
  end,
}
