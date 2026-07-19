-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "gruvbox-dark-hard",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        WinSeparator = { fg = "#131313" },
        Comment = { fg = "#fe8019", ctermfg = 9 },
        LspSignatureActiveParameter = { link = "PMenu", bold = true },
        -- kill non-gruvbox leaks from AstroUI/snacks/etc
        NormalFloat = { fg = "#d5c4a1", bg = "#3c3836" },
        FloatBorder = { fg = "#504945", bg = "#3c3836" },
        FloatTitle = { fg = "#fabd2f", bg = "#3c3836", bold = true },
        CurSearch = { fg = "#3c3836", bg = "#fabd2f" },
        PMenuThumb = { bg = "#665c54" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
