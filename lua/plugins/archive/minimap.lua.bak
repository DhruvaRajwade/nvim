return {
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap", -- Ensure the binary is installed
    config = function()
      -- 🔧 Basic settings
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 0
      vim.g.minimap_auto_start_win_enter = 0
      vim.g.minimap_highlight_range = 1
      vim.g.minimap_highlight_search = 1
      vim.g.minimap_git_colors = 1

      -- ✅ Use code-text rendering instead of blocks
      vim.g.minimap_render = 'text'  -- or 'ascii' for ASCII symbols

      -- Optional: prevent minimap in these filetypes
      vim.g.minimap_block_filetypes = {
        "fugitive", "nerdtree", "tagbar", "fzf", "NvimTree", "toggleterm"
      }

      -- 🎹 Keybindings
      vim.keymap.set("n", "<leader>mm", ":MinimapToggle<CR>", { desc = "Toggle Minimap" })
      vim.keymap.set("n", "<leader>mo", ":MinimapOpen<CR>", { desc = "Open Minimap" })
      vim.keymap.set("n", "<leader>mc", ":MinimapClose<CR>", { desc = "Close Minimap" })
      vim.keymap.set("n", "<leader>mr", ":MinimapRefresh<CR>", { desc = "Refresh Minimap" })
    end
  }
}

