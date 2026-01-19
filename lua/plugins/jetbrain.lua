return {
  "nickkadutskyi/jb.nvim",
  lazy = false,
  priority = 1000,
  enabled = false, -- Disabled to use onedark as default
  opts = {},
  config = function()
    -- require("jb").setup({transparent = true})
    -- vim.cmd "colorscheme jb" -- Commented out to use onedark as default
  end,
}
