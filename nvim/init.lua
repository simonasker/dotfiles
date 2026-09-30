-- ===========================================
-- Options
-- ===========================================
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true
vim.opt.tabstop = 4 -- Number of spaces a tab represent
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.shiftround = true -- Round indent to multiple of shiftwidth
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Enable auto indentation
vim.opt.smartindent = true -- Automatically indent new lines
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.swapfile = false -- Disable swap files
vim.opt.list = true -- Show whitespace characters
vim.opt.cursorline = true -- Highlight the current line
vim.opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
vim.opt.undofile = true -- Enable undoing after closing and reopening a file
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time

-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Syntax highlighting and filetype plugins
vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'

-- ===========================================
-- Keymaps
-- ===========================================

vim.g.mapleader = ' ' -- Space as leader key
vim.g.maplocalleader = ' ' -- Space as leader key
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>ec', ':e $MYVIMRC<CR>', { desc = 'Edit config' })
-- Save with <Leader>w
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
-- Move to the beginning of a line with gh
vim.keymap.set('n', 'gh', 'g^')
-- Move to the end of a line with gl
vim.keymap.set('n', 'gl', 'g$')
-- Move between screen lines with j and k
vim.keymap.set({ 'n', 'x' }, 'j', 'gj')
vim.keymap.set({ 'n', 'x' }, 'k', 'gk')
-- Exit terminal mode with double-Esc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Exit normal mode with kj
vim.keymap.set({ 'i', 't' }, 'kj', '<Esc>', { noremap = true, silent = true })
-- Open terminal with <Leader>td
vim.keymap.set('n', '<leader>t', ':bo sp | term<CR>', { desc = 'Open terminal' })
-- Yank to the system clipboard in visual mode
vim.keymap.set('x', 'y', [["+y]])

-- TODO: I don't quite like how these behave
-- Scroll down and center the cursor
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Scroll up and center the cursor
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- ===========================================
-- Autocommands
-- ===========================================
vim.api.nvim_create_autocmd('TermOpen', { pattern = '*', command = 'startinsert' })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.breakindent = true
  end,
})

-- ===========================================
-- Plugins
-- ===========================================

require 'plugins.telescope'
require 'plugins.treesitter'
require 'plugins.lsp'
require 'plugins.conform'

-- TODO: Find out how to uninstall plugins

-- colorschemes
vim.pack.add {
  'https://github.com/folke/tokyonight.nvim',
  'https://github.com/nanotech/jellybeans.vim',
}
vim.cmd.colorscheme 'jellybeans'

-- Gitsigns
vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

-- require('gitsigns').setup {
-- signs = {
-- add = { text = '+' },
-- change = { text = '~' },
-- delete = { text = '_' },
-- topdelete = { text = '‾' },
-- changedelete = { text = '~' },
-- },
-- }

-- todo-comments
-- vim.pack.add { 'https://github.com/folke/todo-comments.nvim' }
-- require('todo-comments').setup { signs = false }

vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }
-- TODO Maybe I should uninstall this and look for another status line
-- or I could explore what else there is in the mini package
require('mini.statusline').setup { use_icons = false }

-- Autopairs
vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}

-- nvim-tree
-- TODO: I need to find a better setup for file tree exploration
-- vim.pack.add {
--   'https://github.com/nvim-tree/nvim-tree.lua',
--   -- TODO: These icons don't render properly but that might be an issue with my terminal
--   'https://github.com/nvim-tree/nvim-web-devicons',
-- }
-- require('nvim-tree').setup()

-- markdown-plus
vim.pack.add { 'https://github.com/YousefHadder/markdown-plus.nvim' }
require('markdown-plus').setup {
  list = {
    checkbox_completion = {
      enabled = true,
      -- format = 'parenthetical',
      format = 'comment',
      date_format = '%Y-%m-%d',
      remove_on_uncheck = true,
      update_existing = true,
    },
  },
}
