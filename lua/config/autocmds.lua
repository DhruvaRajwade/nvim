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
		"Oil",
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

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*",
-- 	command = "silent! lcd %:p:h",
-- })
vim.api.nvim_create_user_command("Daily", function()
	local log_dir = vim.fn.expand("~/mes_trebuches/logs")
	local template = vim.fn.expand("~/.config/nvim/snippets/markdown/daily.md")
	local today = os.date("%Y-%m-%d")
	local file = log_dir .. "/" .. today .. ".md"

	vim.fn.mkdir(log_dir, "p")

	if vim.fn.filereadable(file) == 0 then
		local lines = {}
		local tmpl = io.open(template, "r")
		if tmpl then
			for line in tmpl:lines() do
				lines[#lines + 1] = line:gsub("{{DATE}}", today)
			end
			tmpl:close()
		end

		local f = io.open(file, "w")
		for _, l in ipairs(lines) do
			f:write(l .. "\n")
		end
		f:close()

		local yesterday = os.date("%Y-%m-%d", os.time() - 24 * 60 * 60)
		local last_file = log_dir .. "/" .. yesterday .. ".md"
		if vim.fn.filereadable(last_file) == 1 then
			local unfinished = {}
			for line in io.lines(last_file) do
				if line:match("^%- %[ %]") then
					unfinished[#unfinished + 1] = line .. " (from [" .. yesterday .. "](" .. yesterday .. ".md))"
				end
			end
			if #unfinished > 0 then
				local buf = {}
				for line in io.lines(file) do
					if line:match("^## Notes") then
						buf[#buf + 1] = "## Carried from Yesterday\n"
						for _, t in ipairs(unfinished) do
							buf[#buf + 1] = t
						end
						buf[#buf + 1] = ""
					end
					buf[#buf + 1] = line
				end
				local f2 = io.open(file, "w")
				for _, l in ipairs(buf) do
					f2:write(l .. "\n")
				end
				f2:close()
			end
		end
	end

	vim.cmd("edit " .. file)
end, {})

vim.api.nvim_create_user_command("WordAdd", function(opts)
	local word = opts.args
	local log_dir = vim.fn.expand("~/mes_trebuches/words")
	local file = log_dir .. "/" .. word .. ".md"

	-- Ensure directory exists
	vim.fn.mkdir(log_dir, "p")

	-- If file doesn't exist, create with template
	if vim.fn.filereadable(file) == 0 then
		local lines = {
			"# " .. word,
			"",
			"**Definition:**  ",
			"",
			"**Links:**  ",
			"- [Dictionary.com](https://www.dictionary.com/browse/" .. word .. ")",
			"- [Merriam-Webster](https://www.merriam-webster.com/dictionary/" .. word .. ")",
			"- [Biology Online](https://www.biologyonline.com/dictionary/" .. word .. ")",
			"",
			"**See also:**  ",
			"- ",
		}
		local f = io.open(file, "w")
		for _, l in ipairs(lines) do
			f:write(l .. "\n")
		end
		f:close()
	end

	-- Open the file in current buffer
	vim.cmd("edit " .. file)
end, { nargs = 1 })
