local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {}
    },
    "gelguy/wilder.nvim",
    "tpope/vim-commentary",
    "psliwka/vim-smoothie",
  {
    "nvim-lualine/lualine.nvim",
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require("lualine").setup({
        options = {
          theme = 'gruvbox',
          icons_enabled = false,
        },
        sections = {
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
          }
        }
      })
    end,
  },
  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup({
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
    end,
  },
  -- save my last cursor position
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
      })
    end,
  },
  { "nvim-telescope/telescope.nvim", tag = '0.1.6' },
  'nvim-lua/plenary.nvim',
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true,
      }
    end
  },
})

-- GUI Settings
vim.api.nvim_set_option('synmaxcol', 500) -- no syntax highlight on long lines for perf.
vim.api.nvim_set_option('lazyredraw', true) -- reduce updates while not typing
vim.api.nvim_set_option('compatible', false)
vim.api.nvim_set_option('cindent', true)

-- Turn on the mouse
vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'  -- Copy/paste to system clipboard

-- Set Tab Size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.wrap = true

vim.opt.smartindent = true -- match previous indent line
vim.opt.smartcase = true
vim.opt.autoread = true -- auomatically reload files
vim.opt.backspace = 'indent,eol,start'
vim.opt.termguicolors = true
vim.opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
vim.opt.showmatch = true     -- Highlight matching parenthesis

vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e') -- Remove filthy whitespace

vim.g.mapleader = " "

-- Key maps for moving around panes.
vim.keymap.set('', '<C-j>', '<C-W>j')
vim.keymap.set('', '<C-k>', '<C-W>k')
vim.keymap.set('', '<C-h>', '<C-W>h')
vim.keymap.set('', '<C-l>', '<C-W>l')
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile!<CR>', { noremap = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

