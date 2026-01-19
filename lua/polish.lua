-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- Ensure onedark is set as the default colorscheme (runs after all plugins load)
vim.api.nvim_create_autocmd("User", {
  pattern = "AstroLspSetup",
  once = true,
  callback = function()
    vim.cmd.colorscheme("onedark")
  end,
})
