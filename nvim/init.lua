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

-- TODO: It's possible that these settings do not feel ideal when editing code
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Syntax highlighting and filetype plugins
vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'

-- ===========================================
-- Keymaps
-- ===========================================

vim.g.mapleader = ' ' -- Space as leader key
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>c', ':e $MYVIMRC<CR>', { desc = 'Edit config' })
-- Save with <Leader>w
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
-- Move to the beginning of a line with gh
vim.keymap.set('n', 'gh', 'g0')
-- Move to the end of a line with gl
vim.keymap.set('n', 'gl', 'g$')
-- Move between screen lines with j and k
vim.keymap.set({ 'n', 'x' }, 'j', 'gj')
vim.keymap.set({ 'n', 'x' }, 'k', 'gk')
-- Exit terminal mode with double-Esc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Exit normal mode with kj
vim.keymap.set('i', 'kj', '<ESC>', { noremap = true, silent = true })
-- Open terminal with <Leader>td
vim.keymap.set('n', '<leader>td', ':bo sp | term<CR>', { desc = 'Open terminal' })
-- Yank to the system clipboard in visual mode
vim.keymap.set('x', 'y', [["+y]])

-- TODO: I don't quite like how these behave
-- Scroll down and center the cursor
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Scroll up and center the cursor
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- pattern = "*.lua",
-- callback = function()
-- vim.lsp.buf.format()
-- end,
-- })

-- ===========================================
-- Autocommands
-- ===========================================
vim.api.nvim_create_autocmd('TermOpen', { pattern = '*', command = 'startinsert' })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
})

-- ===========================================
-- Plugins
-- ===========================================

vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  -- { src = "https://github.com/folke/which-key.nvim" },
  -- { src = "https://github.com/folke/tokyonight.nvim" },
  { src = 'https://github.com/nanotech/jellybeans.vim' },
  { src = 'https://github.com/folke/todo-comments.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-mini/mini.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
}

-- vim.cmd.colorscheme("tokyonight-night")
vim.cmd.colorscheme 'jellybeans'

-- Telescope
local telescope = require 'telescope'

telescope.setup {}

local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.live_grep)

vim.keymap.set(
  'n',
  '<leader>/',
  function()
    require('telescope.builtin').live_grep {
      search_dirs = { vim.fn.expand '%:p' },
    }
  end,
  { desc = 'Grep current file' }
)

-- Gitsigns

-- require('gitsigns').setup {
-- signs = {
-- add = { text = '+' },
-- change = { text = '~' },
-- delete = { text = '_' },
-- topdelete = { text = '‾' },
-- changedelete = { text = '~' },
-- },
-- }
require('todo-comments').setup { signs = false }

-- Treesitter

local parsers = {
  'bash',
  'diff',
  'html',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
  'go',
  'python',
}
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)

    if lang and vim.treesitter.language.add(lang) then
      -- Enable treesitter
      vim.treesitter.start(args.buf, lang)

      -- Enable folding
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldenable = true

      -- Global fold settings
      vim.opt.foldlevel = 99 -- Keep folds open by default
      vim.opt.foldlevelstart = 99 -- Start files unfolded
    end
  end,
})

-- Automatically update parsers when nvim-treesitter is upgraded
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind

    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      if not event.data.active then vim.cmd.packadd 'nvim-treesitter' end

      vim.cmd 'TSUpdate'
    end
  end,
})

require('mini.statusline').setup { use_icons = false }

require('conform').setup {
  notify_on_error = false,
  formatters_by_ft = {
    python = { 'ruff_fix', 'ruff_format' },
    lua = { 'stylua' },
    markdown = { 'mdformat' }, -- maybe use prettier instead
    -- docker = { 'dockerfmt' }
    -- other formatters: dockerfmt, djangofmt, gofmt, gofumpt, goimports, nginxfmt, shellcheck
    -- python: ruff_organize_imports
    -- yaml: yamlfix, yamlfmt
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
