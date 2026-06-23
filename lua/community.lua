-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- AI
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.ai.opencode-nvim" },
  --
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  -- Python: base/black/isort only — no basedpyright (LSP is ty in lua/plugins/astrolsp.lua)
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.black" },
  { import = "astrocommunity.pack.python.isort" },
  { import = "astrocommunity.pack.zig" },
  -- { import = "astrocommunity.pack.cpp" },
  -- { import = "astrocommunity.pack.kotlin" },
  -- { import = "astrocommunity.pack.elm" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.python-ruff" },
  -- { import = "astrocommunity.pack.cs" },
  -- { import = "astrocommunity.pack.sql" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.julia" },
  -- { import = "astrocommunity.pack.ruby" },
  -- { import = "astrocommunity.pack.laravel" },
  -- -- { import = "astrocommunity.pack.haxe" },
  -- { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.nix" },
  -- { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  -- { import = "astrocommunity.pack.tailwindcss" },
  -- { import = "astrocommunity.pack.astro" },
  -- { import = "astrocommunity.pack.angular" },
  -- -- { import = "astrocommunity.pack.haskel" },
  -- { import = "astrocommunity.pack.wgsl" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.swift" },
  -- { import = "astrocommunity.pack.scala" },
  -- { import = "astrocommunity.pack.typst" },
  -- { import = "astrocommunity.pack.svelte" },
  -- { import = "astrocommunity.pack.edgedb" },
  -- { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.proto" },
  -- { import = "astrocommunity.pack.prisma" },
  -- { import = "astrocommunity.pack.godot" },
  -- { import = "astrocommunity.pack.gleam" },
  -- { import = "astrocommunity.pack.just" },
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.ansible" },
  -- { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.helm" },
  -- { import = "astrocommunity.pack.html-css" },
  -- editing support

  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  { import = "astrocommunity.editing-support.rustowl" },

  -- docker
  { import = "astrocommunity.docker.lazydocker" },
  -- import/override with your plugins folder
  -- Colorschemes
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.kanagawa-paper-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine", enabled = true },
  { import = "astrocommunity.colorscheme.gruvbox-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.gruvbox-baby", enabled = true },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.mini-base16" },
  -- { import = "astrocommunity.colorscheme.onigiri" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.recipes.picker-nvchad-theme" },
  -- surround
  { import = "astrocommunity.motion.nvim-surround" },
}
