return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		vim.keymap.set("n", "<leader>g", builtin.live_grep, {})

		vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
		vim.keymap.set("n", "gr", builtin.lsp_references, {})

		vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>S", builtin.lsp_dynamic_workspace_symbols, {})

		vim.keymap.set("n", "<leader>d", builtin.diagnostics, {bufnr=0})
		vim.keymap.set("n", "<leader>D", builtin.diagnostics, {})

		vim.keymap.set("n", "<leader>m", function()
			builtin.lsp_document_symbols({ symbols = "Function" })
		end, {})
		vim.keymap.set("n", "<leader>M", function()
			builtin.lsp_dynamic_workspace_symbols({ symbols = "Function" })
		end, {})
	end,
}
