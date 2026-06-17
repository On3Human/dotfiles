return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "python", "javascript", "c", "markdown", "go","rust"},
    highlight = { enable = true },
    indent = { enable = true },
  },
}
