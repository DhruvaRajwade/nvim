return {

	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- load early to track opened files
		opts = {
			dir = vim.fn.stdpath("state") .. "/sessions/", -- session storage dir
			options = { "buffers", "curdir", "tabpages", "winsize" }, -- session options
		},
	},
}
