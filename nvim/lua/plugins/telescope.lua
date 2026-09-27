vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
}

-- Telescope
local telescope = require 'telescope'

telescope.setup {}

local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.live_grep)
vim.keymap.set('n', '<leader>c', builtin.commands)
vim.keymap.set('n', '<leader>sg', builtin.grep_string)

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 20,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- TODO : Look into the telescope fzf extensions
