vim.pack.add {
  { src = 'https://github.com/stevearc/conform.nvim' },
}

require('conform').setup {
  notify_on_error = false,
  formatters_by_ft = {
    python = { 'ruff_fix', 'ruff_format' },
    lua = { 'stylua' },
    markdown = { 'mdformat' }, -- maybe use prettier instead
    -- TODO: Look into some other formatters
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
