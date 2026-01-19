-- Using Lazy
return {
  "navarasu/onedark.nvim",
  priority = 1011, -- make sure to load this after other colorscheme plugins to ensure it's the default
  config = function()
    require('onedark').setup {
      style = 'darker'
    }
    -- Enable theme
    require('onedark').load()
  end
}
