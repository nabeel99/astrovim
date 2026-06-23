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
  -- If you want to use lspmux with rust-analyzer, set the LSP command to run via lspmux.
  -- This typically looks like: `lspmux rust-analyzer`
  -- cmd = { "lspmux", "rust-analyzer" },
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
      -- Run cargo check automatically on save.
      checkOnSave = true,

      -- Hide rust-analyzer request-failure popups; details stay available in the rust-analyzer logs.
      showRequestFailedErrorNotification = false,

      cargo = {
        -- NOTE: cargo.features is intentionally not set here.
        -- Enable features per-project via codesettings.nvim, e.g. in .vscode/settings.json:
        --   { "rust-analyzer.cargo.features": ["testing"] }
        -- Avoid analyzing tests, benches, examples, and other non-default cargo targets.
        allTargets = false,
        -- Keep rust-analyzer build artifacts separate from normal cargo builds.
        targetDir = "target/rust-analyzer",
        buildScripts = {
          -- Keep build scripts enabled so rust-analyzer can see generated code and proc-macro output.
          enable = true,
          -- Do not rerun build scripts just because build.rs or proc-macro sources change.
          rebuildOnSave = false,
        },
        -- Build scripts need local dev tools for macro/generated-code navigation; this points
        -- rust-analyzer at them. macOS/Homebrew: brew install openssl@3 protobuf llvm.
        -- When sharing this file, keep the shape but replace these paths with local ones.
        extraEnv = {
          OPENSSL_NO_VENDOR = "1",
          OPENSSL_DIR = "/opt/homebrew/opt/openssl@3",
          PROTOC = "/opt/homebrew/opt/protobuf/bin/protoc",
          CC = "/opt/homebrew/opt/llvm/bin/clang",
          CXX = "/opt/homebrew/opt/llvm/bin/clang++",
          AR = "/opt/homebrew/opt/llvm/bin/llvm-ar",
          RANLIB = "/opt/homebrew/opt/llvm/bin/llvm-ranlib",
          SDKROOT = "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
        },
      },
      check = {
        command = "clippy",
        -- Avoid analyzing non-default cargo targets when checking.
        allTargets = false,
        -- If checking is manually triggered, check the current package instead of the full workspace.
        workspace = false,
        -- Same dependency env for manual checks; keep in sync with cargo.extraEnv above.
        extraEnv = {
          OPENSSL_NO_VENDOR = "1",
          OPENSSL_DIR = "/opt/homebrew/opt/openssl@3",
          PROTOC = "/opt/homebrew/opt/protobuf/bin/protoc",
          CC = "/opt/homebrew/opt/llvm/bin/clang",
          CXX = "/opt/homebrew/opt/llvm/bin/clang++",
          AR = "/opt/homebrew/opt/llvm/bin/llvm-ar",
          RANLIB = "/opt/homebrew/opt/llvm/bin/llvm-ranlib",
          SDKROOT = "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
        },
      },
      -- Keep eager cache priming enabled so references/definitions are ready sooner after startup.
      cachePriming = { enable = true },
      -- Keep procedural macro expansion enabled for better navigation through macro-heavy code.
      procMacro = { enable = true },
      -- Exclude tests from references/call hierarchy results.
      references = { excludeTests = true },
      -- Don't analyze large generated/build folders (LSP equivalent of VS Code's files/search excludes).
      files = {
        excludeDirs = {
          "target",
          "node_modules",
          "test-ledger",
          "localnet-ledger",
          "validator-ledger",
          "tmp",
        },
      },
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
    -- Project-local settings (e.g. lspsettings.json / .vscode/settings.json) are merged
    -- automatically by rustaceanvim via codesettings.nvim when that plugin is installed,
    -- so no manual call is needed here.
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
