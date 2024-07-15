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
      },
    },
  },
}
