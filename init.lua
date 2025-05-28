require("config.lazy")

require("options")
require("lazy").setup("plugins")
require("keymaps")
require("autocmds")

vim.cmd.colorscheme("catppuccin")

vim.opt.termguicolors = true

vim.notify = require("notify")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lazy",
  callback = function()
    vim.keymap.set("n", "<Esc>", "<cmd>q<CR>", { buffer = true, silent = true })
  end,
})

vim.g.python3_host_prog = "/home/stormageddon/.pyenv/versions/neovim-env/bin/python"
