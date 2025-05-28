-- return {
--   {
--   "iamcco/markdown-preview.nvim",
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   build = "cd app && yarn install",
--   init = function()
--     vim.g.mkdp_filetypes = { "markdown" }
--   end,
--   ft = { "markdown" },
--
--   },
--
--   }
return {

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "saghen/blink.cmp" },
    config = function()
      require("render-markdown").setup({
        completions = { blink = { enabled = true } },
      })
    end,
  },
}
