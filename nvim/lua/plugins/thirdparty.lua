return {
  -- surrounds selections
  {
    "kylechui/nvim-surround",
    version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
    -- config = function()
    --     require("nvim-surround").setup({
    --         -- Put your configuration here
    --     })
    -- end
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      -- Follow the nvim symlink so we can locate the actual dotfiles repo root.
      local config_dir = vim.fn.resolve(vim.fn.stdpath("config"))
      local dotfiles_dir = vim.fn.fnamemodify(config_dir, ":h")

      -- Share one VS Code snippet file between Neovim and VS Code.
      require("luasnip.loaders.from_vscode").load_standalone({
        path = dotfiles_dir .. "/vscode/all.code-snippets",
      })
      require("luasnip").config.setup({
        update_events = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })
    end,
  },
  {
    -- Blink handles completion, so it needs to use the same snippet backend we load above.
    "saghen/blink.cmp",
    optional = true,
    opts = {
      snippets = {
        preset = "luasnip",
      },
    },
  },
}
