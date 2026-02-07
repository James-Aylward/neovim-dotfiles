return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("marks").setup({
			signs = true,
			builtin_marks = { ".", "<", ">", "^" },
			default_mappings = true,
			vim.api.nvim_set_hl(0, "MarkSignNumHL", { bg = "NONE" }),
		})
	end,
}
