return {
  "mrjones2014/codesettings.nvim",
  -- Load eagerly so `require("codesettings")` is ready when an LSP's before_init runs.
  lazy = false,
  opts = {
    -- Files searched upward from the project root for local settings.
    config_file_paths = {
      ".vscode/settings.json",
      "codesettings.json",
      "lspsettings.json",
    },
    -- Arrays from local files are appended to base config arrays.
    -- (Base `rust-analyzer.cargo.features` is empty, so per-project lists win cleanly.)
    merge_lists = "append",
  },
}
