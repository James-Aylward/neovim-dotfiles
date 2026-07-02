-- Bootstrap lazy.nvim ---------------------------------------------------------
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
--------------------------------------------------------------------------------

require("options")
require("keybinds")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function(args)
        pcall(vim.treesitter.start, args.buf)
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
	end,
})

--vim.o.pumborder = "rounded"
--vim.o.complete = ".,o"
--vim.o.completeopt = "fuzzy,menuone,noselect"
--vim.o.autocomplete = true
--vim.o.pumheight = 7

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("pyright")


require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true },
})

