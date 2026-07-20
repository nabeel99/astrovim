-- Replace AstroNvim's Blink completion UI with the same plain nvim-cmp
-- setup used by Jon Gjengset: no border, no icons, no custom formatting.

---@type LazySpec
return {
  -- AstroNvim v6 uses Blink by default. Only one completion engine should run.
  {
    "saghen/blink.cmp",
    enabled = false,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },

    config = function()
      local cmp = require "cmp"

      cmp.setup {
        snippet = {
          expand = function(args) vim.snippet.expand(args.body) end,
        },

        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          -- Match Jon's behavior: Enter accepts the selected item.
          ["<CR>"] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
          },
        },

        -- Jon uses LSP completion first and paths second.
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "path" },
        }),

        -- Intentionally omit `window` and `formatting`.
        -- This produces nvim-cmp's plain borderless Pmenu with textual kinds.
        experimental = {
          ghost_text = true,
        },
      }

      -- Match Jon's path completion in command-line mode.
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources {
          { name = "path" },
        },
      })
    end,
  },

  -- Advertise nvim-cmp completion capabilities to every AstroLSP server.
  {
    "AstroNvim/astrolsp",
    optional = true,

    opts = function(_, opts)
      opts.config = opts.config or {}
      opts.config["*"] = opts.config["*"] or {}

      opts.config["*"].capabilities = vim.tbl_deep_extend(
        "force",
        opts.config["*"].capabilities or {},
        require("cmp_nvim_lsp").default_capabilities()
      )
    end,
  },
}

