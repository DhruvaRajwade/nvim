return {

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end)

			-- Add these lines in your `config = function()` block, after setting keymaps

			-- Keymaps to go to specific files
			for i = 1, 9 do
				vim.keymap.set("n", "<leader>h" .. i, function()
					harpoon:list():select(i)
				end, { desc = "Harpoon file " .. i })
			end

			-- Delete the current buffer from Harpoon
			vim.keymap.set("n", "<leader>hd", function()
				require("harpoon"):list():remove()
			end, { desc = "Delete current buffer from Harpoon" })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end)

			vim.keymap.set("n", "<leader>he", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
		end,
	},

	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("marks").setup({
				default_mappings = true,
				builtin_marks = { ".", "<", ">", "^" },
				cyclic = true,
				force_write_shada = false,
				refresh_interval = 250,
				excluded_filetypes = {},
				excluded_buftypes = {},
				bookmark_0 = {
					sign = "⚑",
					virt_text = "hello world",
					annotate = false,
				},
				mappings = {},
			})
		end,
	},
}
