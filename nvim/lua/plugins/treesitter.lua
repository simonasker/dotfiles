vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
}

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

require('nvim-treesitter-textobjects').setup {
  select = {
    enable = true,
    lookahead = true,
    selection_modes = {
      ['@function.outer'] = 'V',
      -- ['@class.outer'] = '<c-v>',
      ['@class.outer'] = 'V',
    },
  },
}

local select = require 'nvim-treesitter-textobjects.select'

vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end)
vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end)

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
