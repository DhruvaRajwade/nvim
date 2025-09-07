return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		default = {
			verbose = false,
			drag_and_drop = {
				insert_mode = false,
			},
		},
	},
	keys = {
		-- suggested keymap
		{ "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },

		-- snacks picker for images
		{
			"<leader>iP",
			function()
				require("snacks").picker.files({
					ft = { "jpg", "jpeg", "png", "webp" },
					confirm = function(self, item, _)
						self:close()
						require("img-clip").paste_image({}, "./" .. item.file) -- ./ needed for img-clip
					end,
				})
			end,
			desc = "Pick and paste image with img-clip",
		},
	},
}
