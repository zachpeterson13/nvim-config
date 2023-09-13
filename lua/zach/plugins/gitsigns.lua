return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup()

		vim.cmd([[hi GitSignsAdd guibg=NONE]])
		vim.cmd([[hi GitSignsDelete guibg=NONE]])
		vim.cmd([[hi GitSignsChange guibg=NONE]])
	end,
}
