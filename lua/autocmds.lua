local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Create a general group to avoid duplicate autocmds on reload
local general = augroup("General", { clear = true })

--show diagnostics on cursor hold

vim.o.updatetime = 250

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
  end,
})

-- Make shell scripts executable on save
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("MakeExecutable", { clear = true }),
  pattern = "*.sh",
  desc = "Make shell scripts executable after save",
  callback = function()
    vim.fn.jobstart({ "chmod", "+x", vim.fn.expand("<afile>") })
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  desc = "Briefly highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Automatically remove trailing whitespace on save
autocmd("BufWritePre", {
  group = general,
  desc = "Remove trailing whitespace on save",
  pattern = "*",
  command = [[:%s/\s\+$//e]],
})

-- Auto-reload file if changed outside of Neovim
autocmd({ "FocusGained", "BufEnter" }, {
  group = general,
  desc = "Auto reload changed files",
  command = "checktime",
})

-- Restore cursor position when reopening a file
autocmd("BufReadPost", {
  group = general,
  desc = "Restore last cursor position",
  callback = function()
    local line = vim.fn.line
    if line("'\"") > 1 and line("'\"") <= line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

-- Spellcheck for certain file types
autocmd("FileType", {
  group = general,
  pattern = { "gitcommit", "text", "tex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})
