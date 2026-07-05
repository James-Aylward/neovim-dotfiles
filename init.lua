-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = true },
})

vim.lsp.enable("clangd")
vim.lsp.enable("nil_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("statix")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "gDh", function()
			vim.cmd("split")
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gDv", function()
			vim.cmd("vsplit")
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>s", function()
			vim.lsp.buf.document_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>S", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>w", function()
			vim.lsp.buf.format()
		end, opts)
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.setqflist()
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

require("mini.ai").setup()
require("mini.animate").setup()
require("mini.basics").setup()
require("mini.bracketed").setup()
require("mini.comment").setup()
require("mini.extra").setup()
require("mini.files").setup()
require("mini.git").setup()
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.jump").setup()
require("mini.jump2d").setup()
require("mini.move").setup()
require("mini.notify").setup()
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()
require("mini.cmdline").setup()

vim.keymap.set("n", "<leader>f", "<Cmd>Pick files<CR>", {})
vim.keymap.set("n", "<leader>g", "<Cmd>Pick grep_live<CR>", {})
vim.keymap.set("n", "-", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Open mini.files (directory of current file)" })

-- Tabs = 4 spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.o.cmdheight = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.foldlevelstart = 99
vim.opt.hlsearch = false
vim.opt.isfname:append("@-@")
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
