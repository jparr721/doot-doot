vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e') -- Remove filthy whitespace
vim.o.signcolumn = "yes"
vim.o.wrap = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.g.mapleader = " "
vim.opt.mouse = 'a'               -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
vim.api.nvim_set_option('synmaxcol', 500) -- no syntax highlight on long lines for perf.
vim.api.nvim_set_option('lazyredraw', true) -- reduce updates while not typing
vim.api.nvim_set_option('compatible', false)
vim.api.nvim_set_option('cindent', true)

vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')
vim.keymap.set('n', '<leader>r', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)

vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/gelguy/wilder.nvim" },
	{ src = "https://github.com/tpope/vim-commentary" },
	{ src = "https://github.com/psliwka/vim-smoothie" }
})

require 'mini.pick'.setup()
require 'oil'.setup({
	view_options = {
		show_hidden = true
	}
})

-- LSP
vim.lsp.enable({
	"biome",
	"lua_ls",
})
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>g', ':Pick grep<CR>')
vim.keymap.set('n', '<C-n>', ':Oil<CR>')
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
