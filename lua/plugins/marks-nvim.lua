return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
require('marks').setup({
	signs = true,
	builtin_marks = { ".", "<", ">", "^" },
	default_mappings = true,
})

end,
}

