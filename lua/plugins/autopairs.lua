return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")

			npairs.setup({})

			-- Add $...$ rule only in markdown
			npairs.add_rules({
				Rule("$", "$", "markdown")
					:with_pair(function(opts)
						-- don’t pair if the previous char is \
						if opts.prev_char:match("\\") then
							return false
						end
						return true
					end)
					-- don’t move past an existing $
					:with_move(cond.none())
					-- don’t delete both if backspacing
					:with_del(cond.none())
					-- don’t add extra newline behavior
					:with_cr(cond.none()),
			})
		end,
	},
}

-- return {
--
-- 	{
-- 		"windwp/nvim-autopairs",
-- 		event = "InsertEnter",
-- 		config = true,
-- 		-- use opts = {} for passing setup options
-- 		-- this is equivalent to setup({}) function
-- 	},
-- }
