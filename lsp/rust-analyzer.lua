---@brief
---
--- https://github.com/rust-lang/rust-analyzer
---

local function reload_workspace(bufnr)
  local clients = vim.lsp.get_clients { bufnr = bufnr, name = "rust_analyzer" }
  for _, client in ipairs(clients) do
    vim.notify "Reloading Cargo Workspace"
    client:request("rust-analyzer/reloadWorkspace", nil, function(err)
      if err then error(tostring(err)) end
      vim.notify "Cargo workspace reloaded"
    end, 0)
  end
end

---@type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },

  -- IMPORTANT:
  -- Do NOT define root_dir.
  -- rustaceanvim handles Cargo workspaces synchronously and safely.

  capabilities = {
    experimental = {
      serverStatusNotification = true,
      commands = {
        commands = {
          "rust-analyzer.showReferences",
          "rust-analyzer.runSingle",
          "rust-analyzer.debugSingle",
        },
      },
    },
  },

  settings = {
    ["rust-analyzer"] = {
      lens = {
        debug = { enable = true },
        enable = true,
        implementations = { enable = true },
        references = {
          adt = { enable = true },
          enumVariant = { enable = true },
          method = { enable = true },
          trait = { enable = true },
        },
        run = { enable = true },
        updateTest = { enable = true },
      },
    },
  },

  before_init = function(init_params, config)
    if config.settings and config.settings["rust-analyzer"] then
      init_params.initializationOptions = config.settings["rust-analyzer"]
    end

    vim.lsp.commands["rust-analyzer.runSingle"] = function(command)
      local r = command.arguments[1]
      local cmd = { "cargo", unpack(r.args.cargoArgs) }
      if r.args.executableArgs and #r.args.executableArgs > 0 then
        vim.list_extend(cmd, { "--", unpack(r.args.executableArgs) })
      end

      local proc = vim.system(cmd, { cwd = r.args.cwd })
      local result = proc:wait()

      if result.code == 0 then
        vim.notify(result.stdout, vim.log.levels.INFO)
      else
        vim.notify(result.stderr, vim.log.levels.ERROR)
      end
    end
  end,

  on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(
      bufnr,
      "LspCargoReload",
      function() reload_workspace(bufnr) end,
      { desc = "Reload current cargo workspace" }
    )
  end,
}
