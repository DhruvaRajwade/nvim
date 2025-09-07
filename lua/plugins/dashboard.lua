return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"      _=====_                               _=====_      ",
					"     / _____ \\                             / _____ \\     ",
					"   +.-'_____'-.---------------------------.-'_____'-.+   ",
					"  /   |     |  '.        S O N Y        .'  |  _  |   \\  ",
					" / ___| /|\\ |___ \\                     / ___| /_\\ |___ \\ ",
					"/ |      |      | ;  __           _   ; | _         _ | ;",
					"| | <---   ---> | | |__|         |_:> | ||_|       (_)| |",
					"| |___   |   ___| ;SELECT       START ; |___       ___| ;",
					"|\\    | \\|/ |    /  _     ___      _   \\    | (X) |    /|",
					"| \\   |_____|  .','\" \"', |___|  ,'\" \"', '.  |_____|  .' |",
					"|  '-.______.-' /       \\ANALOG/       \\  '-._____.-'   |",
					"|               |       |------|       |                |",
					"|              /\\       /      \\       /\\               |",
					"|             /  '.___.'        '.___.'  \\              |",
					"|            /                            \\             |",
					" \\          /         SUNNY INNIT?         \\           / ",
					"  \\________/                                \\_________/  ",
					"                                                             ",
				},

				center = {
					{
						icon = "🚀  ",
						desc = "Find Deez Files",
						action = [[lua require("snacks.picker").files()]],
						key = "f",
					},
					{
						icon = "💾  ",
						desc = "Restore Previous Sessions",
						action = [[lua require("persistence").select()]],
						-- action = "Telescope session-lens search_session",
						key = "s",
					},
					{
						icon = "📄  ",
						desc = "Recent Nuts",
						action = [[lua require("snacks.picker").recent()]],
						key = "r",
					},
					{
						icon = "🧠  ",
						desc = "Tinker With The Config",
						action = "cd ~/.config/nvim | Oil .",
						key = "c",
					},
					{ icon = "🛑  ", desc = "Quit Neovim", action = "qa", key = "q" },
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return {
						"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						"🚀 Powered by DEEZ NUTS. Stay based.",
					}
				end,
				-- footer = {
				-- 	"🚀 Powered by DEEZ NUTS. Stay based.",
				-- },
			},
		})
	end,
}
