return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      keys = {
    { "<leader> ", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in Current Buffer" },
  },
    dependencies = { 'nvim-lua/plenary.nvim' }
    },

  {
 'nvim-telescope/telescope-ui-select.nvim',
    config = function()
    require("telescope").setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
})
require("telescope").load_extension("ui-select")
    end
  },

}
