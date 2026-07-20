-- Make AstroNvim's nvim-cmp completion popup resemble Jon Gjengset's:
-- a plain, borderless menu with completion text and a textual kind column.

---@type LazySpec
return {
  {
    "hrsh7th/nvim-cmp",

    opts = function(_, opts)
      -- Remove AstroNvim's bordered/custom floating-window presentation.
      -- nvim-cmp will fall back to its native borderless Pmenu appearance.
      opts.window = nil
      opts.view = nil

      opts.completion = {
        completeopt = "menu,menuone,noselect",
      }

      -- Remove Nerd Font icons and source labels. Jon's menu shows entries
      -- such as `OutputFile                         Struct`.
      opts.formatting = {
        fields = { "abbr", "kind" },
        expandable_indicator = false,

        format = function(_, item)
          item.menu = ""
          return item
        end,
      }

      opts.experimental = opts.experimental or {}
      opts.experimental.ghost_text = true

      return opts
    end,
  },
}
