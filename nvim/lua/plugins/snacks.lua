return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true, -- global default
      ignored = true,

      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = { ".git", "node_modules" },
        },
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { ".git", "node_modules" },
        },
      },
    },
  },
}
