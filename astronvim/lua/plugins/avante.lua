return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
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
      },
      claude = {
        model = "claude-3-5-haiku-latest",
        -- model = "claude-3-5-sonnet-latest",
        max_tokens = 8000, -- To match the config in https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
      },
      mappings = {
        diff = {
          cursor = "cu", -- The default `cc` conflicts with my mapping to change the current line.
        },
      },
      vendors = {
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "qwen2.5-coder:32b-base-q2_K",
        },
      },
      windows = {
        ask = {
          focus_on_apply = "theirs", -- which diff to focus after applying
          start_insert = false,
        },
        width = 40, -- default % based on available width
      },
    },
  },
}
