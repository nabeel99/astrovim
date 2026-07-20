-- AstroCore provides a central place to modify mappings, Vim options,
-- autocommands, and more.
-- Configuration documentation: :h astrocore

---@type LazySpec
return {
  "AstroNvim/astrocore",

  init = function()
    local group = vim.api.nvim_create_augroup("JonGjengsetStyle", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = group,
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Disable LSP semantic highlighting without calling
        -- vim.lsp.semantic_tokens.enable(), avoiding the Neovim 0.12
        -- bufnr/client_id filter assertion entirely.
        if client then
          client.server_capabilities.semanticTokensProvider = nil
        end

        -- Keep inlay hints disabled for this buffer.
        if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
          vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
        end
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "rust",
      callback = function(args)
        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(args.buf) then return end

          -- Use Vim's traditional Rust syntax groups.
          pcall(vim.treesitter.stop, args.buf)
          vim.bo[args.buf].syntax = "rust"
        end)
      end,
    })
  end,

  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },

    diagnostics = {
      virtual_text = true,
      underline = true,
    },

    filetypes = {
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },

    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        background = "dark",
        termguicolors = true,
        cursorline = false,
        showmode = false,

        guicursor = table.concat({
          "n-v-c:block-Cursor",
          "i-ci-ve:ver25-Cursor",
          "r-cr:hor20-Cursor",
          "o:hor50-Cursor",
        }, ","),
      },

      g = {},
    },

    mappings = {
      n = {
        ["]b"] = {
          function() require("astrocore.buffer").nav(vim.v.count1) end,
          desc = "Next buffer",
        },
        ["[b"] = {
          function() require("astrocore.buffer").nav(-vim.v.count1) end,
          desc = "Previous buffer",
        },

        ["<Leader>gg"] = {
          function() require("neogit").open() end,
          desc = "Neogit",
        },

        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}
