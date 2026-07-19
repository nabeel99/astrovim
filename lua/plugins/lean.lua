-- Lean theorem prover support + LSP (https://github.com/Julian/lean.nvim)
-- Requires the Lean toolchain (elan/lake) installed on the system for the LSP to start.
---@type LazySpec
return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    -- optional extras:
    -- "andymass/vim-matchup",
    -- "andrewradev/switch.vim",
  },
  ---@type lean.Config
  opts = {
    mappings = true, -- enable default lean.nvim keybindings in lean buffers
    lsp = {}, -- start the Lean language server (leanls)
    infoview = {
      autoopen = true, -- show the infoview (goal state) automatically
    },
  },
}
