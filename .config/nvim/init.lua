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
vim.o.mouse = 'a'                         -- Enable mouse support
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'           -- Copy/paste to system clipboard
vim.o.updatetime = 250
vim.api.nvim_set_option('synmaxcol', 500)   -- no syntax highlight on long lines for perf.
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
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

vim.pack.add({
  { src = "https://github.com/vague-theme/vague.nvim" },
  { src = "https://github.com/nvim-mini/mini.pick" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/gelguy/wilder.nvim" },
  { src = "https://github.com/tpope/vim-commentary" },
  { src = "https://github.com/psliwka/vim-smoothie" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" }
})

require 'mini.pick'.setup()
require 'oil'.setup({
  view_options = {
    show_hidden = true
  }
})
require "nvim-tree".setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
        diagnostics = false,
        bookmarks = false
      }
    }
  },
  sort_by = "case_sensitive",
  filters = {
    dotfiles = true,
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return {
        desc = 'nvim-tree: ' .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
  end
})
-- LSP
vim.lsp.enable({
  "biome",
  "lua_ls",
  "ts_ls",
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Completion
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Signature help
    if client:supports_method('textDocument/signatureHelp') then
      vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { buffer = ev.buf })

      vim.api.nvim_create_autocmd('CursorHoldI', {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.signature_help()
        end
      })
    end
  end,
})
vim.cmd("set completeopt+=noselect")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>g', ':Pick grep<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile!<CR>', { noremap = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
