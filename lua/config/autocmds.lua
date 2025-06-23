local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local close_group = vim.api.nvim_create_augroup("q_close", { clear = true })
-- Create a general group to avoid duplicate autocmds on reload
local general = augroup("General", { clear = true })

--show diagnostics on cursor hold

vim.o.updatetime = 250

local function close_or_quit()
	local win_count = #vim.api.nvim_list_wins()
	local listed_bufs = vim.fn.getbufinfo({ buflisted = 1 })

	if win_count == 1 and #listed_bufs <= 1 then
		vim.cmd("qall!")
	elseif win_count == 1 then
		vim.notify("Cannot close the last window without quitting Neovim.", vim.log.levels.WARN)
	else
		pcall(vim.api.nvim_command, "close")
	end
end

-- autocmd("CursorHold", {
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
--   end,
-- })
--
-- Make shell scripts executable on save
autocmd("BufWritePost", {
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

autocmd("FileType", {
	pattern = "lazy",
	callback = function()
		vim.keymap.set("n", "<Esc>", "<cmd>q<CR>", { buffer = true, silent = true })
	end,
})

-- Close with 'q' in special buffers
autocmd("FileType", {
	group = close_group,
	pattern = {
		"checkhealth",
		"git",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"snacks_dashboard",
		"spectre_panel",
		"startuptime",
		"lazy", -- Added Lazy plugin filetype
	},
	desc = "Map 'q' to close for helper filetypes",
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", close_or_quit, {
			buffer = event.buf,
			silent = true,
			noremap = true,
			desc = "Close window",
		})
	end,
})

-- Resize splits on window resize
autocmd("VimResized", {
	group = augroup("resize", { clear = true }),
	desc = "Auto resize splits",
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Reload file if changed externally
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime", { clear = true }),
	desc = "Check for file changes",
	callback = function()
		vim.defer_fn(function()
			vim.cmd.checktime()
		end, 50)
	end,
})

-- hide copilot in autocomplete menu
autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		vim.b.copilot_suggestion_hidden = true
	end,
})

autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	callback = function()
		vim.b.copilot_suggestion_hidden = false
	end,
})
