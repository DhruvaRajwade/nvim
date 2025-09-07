return {
	-- { "jbyuki/nabla.nvim" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "saghen/blink.cmp" },
		config = function()
			require("render-markdown").setup({
				completions = { blink = { enabled = true } },
				file_types = { "markdown" },
				latex = { enabled = false },
				win_options = { conceallevel = { rendered = 2 } },
			})
		end,
	},
	-- {
	-- 	{ "ryleelyman/latex.nvim", opts = {} },
	-- 	{
	-- 		"MeanderingProgrammer/render-markdown.nvim",
	-- 		dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 		opts = {
	-- 			latex = { enabled = false },
	-- 			win_options = { conceallevel = { rendered = 2 } },
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("render-markdown").setup({
	-- 			file_types = { "markdown" },
	-- 			latex = { enabled = false },
	-- 			win_options = {
	-- 				conceallevel = {
	-- 					default = vim.api.nvim_get_option_value("conceallevel", {}),
	-- 					rendered = 2, -- <- especially this, so that both plugins play nice
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
