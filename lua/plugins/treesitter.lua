-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    treesitter = {
      highlight = false,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "rust",
        "sql",
      },
    },
  },
}
