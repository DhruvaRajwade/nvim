return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Auto-update parsers after install
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "python",
        "bash",
        "json",
        "yaml",
        "vim",
        "markdown",
        "html",
        "css",
        "javascript",
        "typescript",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
