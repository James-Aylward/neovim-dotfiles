return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>m', function() builtin.lsp_document_symbols({ symbols = 'Function' }) end, { })
end
}
