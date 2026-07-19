-- Neogit: magit-like git interface (experimenting in place of lazygit)
---@type LazySpec
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional: diff integration
    "folke/snacks.nvim", -- optional: picker integration
  },
  -- keybinds live in lua/plugins/astrocore.lua (override AstroNvim's lazygit maps);
  -- requiring "neogit" from those maps lazy-loads this plugin on demand.
  cmd = "Neogit",
  opts = {},
}
