return {
  "wincent/base16-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark"
    vim.cmd [[colorscheme gruvbox-dark-hard]]
    -- jonhoo: transparent terminal background only, keep guibg
    vim.cmd [[hi Normal ctermbg=NONE]]
  end,
}
