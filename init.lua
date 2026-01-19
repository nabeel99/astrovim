-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.

local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
require "mappings.rust"

-- Fix terminal key codes to ensure arrow keys work properly
-- This is especially important after exiting search mode
vim.opt.ttyfast = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

vim.keymap.set("n", "<Up>", "gk", { noremap = true })
vim.keymap.set("n", "<Down>", "gj", { noremap = true })
vim.keymap.set("v", "<Up>", "gk", { noremap = true })
vim.keymap.set("v", "<Down>", "gj", { noremap = true })

-- This will remove any active search highlight until you initiate a new search.
-- If you want to prevent the highlight from being persistent after each search, add this to your init.lua or init.vim:
-- TODO: Cross-Check if this is necessary: Saturday 5 October 2024
--
vim.opt.hlsearch = false
-- vim.lsp.enable { "rust-analyzer" }
-- nmap <C-n> <Plug>(VM-Find-Under)
-- vmap <C-n> <Plug>(VM-Find-Under)
