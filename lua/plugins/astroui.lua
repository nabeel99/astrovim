-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation: :h astroui

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "gruvbox-dark-hard",

    highlights = {
      init = {
        -- Core editor palette
        Normal = { fg = "#d5c4a1", bg = "#1d2021" },
        NormalNC = { fg = "#d5c4a1", bg = "#1d2021" },

        -- Jon Gjengset uses a very dark window separator.
        WinSeparator = { fg = "#131313" },

        -- In Jon's config, Comment receives the Boolean highlight.
        Comment = { link = "Boolean" },

        -- Warm Gruvbox block cursor.
        Cursor = { fg = "#1d2021", bg = "#d5c4a1" },
        lCursor = { fg = "#1d2021", bg = "#d5c4a1" },
        CursorIM = { fg = "#1d2021", bg = "#d5c4a1" },
        TermCursor = { fg = "#1d2021", bg = "#d5c4a1" },

        -- Visual selection and the permanently shaded number/sign gutter.
        Visual = { bg = "#504945" },
        LineNr = { fg = "#665c54", bg = "#3c3836" },
        CursorLineNr = { fg = "#bdae93", bg = "#3c3836", bold = false },
        SignColumn = { fg = "#665c54", bg = "#3c3836" },
        FoldColumn = { fg = "#665c54", bg = "#3c3836" },

        -- Make the active signature argument clearly visible.
        LspSignatureActiveParameter = { link = "PMenu", bold = true },

        -- Keep AstroNvim/Snacks floating windows inside the same palette.
        NormalFloat = { fg = "#d5c4a1", bg = "#3c3836" },
        FloatBorder = { fg = "#504945", bg = "#3c3836" },
        FloatTitle = { fg = "#fabd2f", bg = "#3c3836", bold = true },

        CurSearch = { fg = "#3c3836", bg = "#fabd2f" },
        Pmenu = {
          fg = "#d5c4a1",
          bg = "#3c3836",
        },

        PmenuSel = {
          fg = "#d5c4a1",
          bg = "#504945",
        },

        PmenuSbar = {
          bg = "#3c3836",
        },

        PmenuThumb = {
          bg = "#665c54",
        },
      },
    },

    icons = {
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
