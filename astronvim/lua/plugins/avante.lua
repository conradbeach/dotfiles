return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.mappings.n["<Leader>a"] = { desc = " Avante" }
        end,
      },
      "echasnovski/mini.icons",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
    opts = {
      behaviour = {
        support_paste_from_clipboard = false,
        enable_claude_text_editor_tool_mode = false,
      },
      claude = {
        model = "claude-3-5-haiku-latest",
        -- model = "claude-3-7-sonnet-latest",
        disable_tools = true
      },
      mappings = {
        diff = {
          cursor = "cu", -- The default `cc` conflicts with my mapping to change the current line.
        },
      },
      ollama = {
        model = "qwen2.5-coder:32b-base-q2_K",
      },
      windows = {
        ask = {
          focus_on_apply = "theirs", -- which diff to focus after applying
          start_insert = false,
        },
        width = 40, -- default % based on available width
      },
    },
    specs = { -- configure optional plugins
      { "AstroNvim/astroui", opts = { icons = { Avante = "" } } },
    },
  },
}
