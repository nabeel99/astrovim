return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping = cmp.mapping.preset.insert(vim.tbl_extend("force", opts.mapping, {
      ["<CR>"] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Insert,
      }),
      ["<Down>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<Up>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end, { "i", "s" }),
    }))

    -- Disable cmp while vim-visual-multi is active.
    -- VM takes over insert-mode keymaps during multi-cursor editing;
    -- when it exits it does not restore cmp's mappings, which breaks
    -- arrow-key navigation in the completion menu.
    -- The clean fix: turn cmp off for the buffer while VM is running,
    -- then turn it back on when VM exits.
    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_start",
      callback = function()
        cmp.setup.buffer({ enabled = false })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "visual_multi_exit",
      callback = function()
        cmp.setup.buffer({ enabled = true })
      end,
    })
  end,
}
