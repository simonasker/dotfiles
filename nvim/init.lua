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
vim.opt.undofile = true
vim.opt.ignorecase = true 
vim.opt.smartcase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time



-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')



-- ===========================================
-- Keymaps
-- ===========================================

vim.g.mapleader = ' ' -- Space as leader key
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- TODO This does not quite work since I don't use the envvar
vim.keymap.set('n', '<leader>c', ':e $MYVIMRC<CR>', { desc = 'Edit config' })
-- Save with <Leader>w
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
-- Move to the beginning or end of the line with gh/gl
vim.keymap.set('n', 'gh', '^')
vim.keymap.set('n', 'gl', '$')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Exit normal mode with kj
vim.keymap.set('i', 'kj', '<ESC>', { noremap = true, silent = true })
-- Open terminal with <Leader>td
vim.keymap.set('n', '<leader>td', ':bo sp | term<CR>', { desc = 'Open terminal' })
vim.keymap.set("x", "y", [["+y]]) -- Yank to the system clipboard in visual mode
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor

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

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
