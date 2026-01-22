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

-- Automatically start lspmux server if it's not already running
local function start_lspmux()
  -- Check if lspmux server is already running to avoid starting multiple instances
  -- We use a simple check: try to see if the process exists
  local handle = io.popen("pgrep -f 'lspmux server' 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result ~= "" then
      -- lspmux server is already running
      return
    end
  end

  -- Start lspmux server in the background
  -- Using detach = true ensures it continues running even if Neovim closes
  vim.fn.jobstart({ "lspmux", "server" }, {
    detach = true,
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify("lspmux server exited with code " .. code, vim.log.levels.WARN)
      end
    end,
  })
end

-- Start lspmux server after a short delay to ensure everything is initialized
vim.defer_fn(start_lspmux, 1000)
