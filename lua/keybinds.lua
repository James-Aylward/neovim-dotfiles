vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Moving lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")
vim.keymap.set("n", "<leader>o", ":copen<CR>")
vim.keymap.set("n", "<leader>c", ":cclose<CR>")

vim.keymap.set("n", "<M-j>", ":lnext<CR>")
vim.keymap.set("n", "<M-k>", ":lprev<CR>")
vim.keymap.set("n", "<M-o>", ":lopen<CR>")
vim.keymap.set("n", "<M-c>", ":lclose<CR>")

vim.keymap.set({ "n", "x", "o" }, ",", "<Plug>(leap)")
vim.keymap.set("n", "gw", "<Plug>(leap-from-window)")
-- LSP stuff
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>w", function()
			vim.lsp.buf.format()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>a", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>r", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})
