return {
  "armannikoyan/rusty",
  lazy = false,
  priority = 1000,
  enabled = false, -- Disabled to use onedark as default colorscheme
  opts = {
    transparent = true,
    italic_comments = true,
    underline_current_line = true,
  },
  config = function(_, opts)
    require("rusty").setup(opts)
    -- vim.cmd "colorscheme rusty" -- Commented out to use onedark as default
  end,
}
