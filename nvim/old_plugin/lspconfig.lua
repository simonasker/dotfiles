local lspconfig = require('lspconfig')


lspconfig.ruff.setup{
    cmd = {"python", "-m", "ruff", "server"}
}

vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('AutoFormatting', {}),
    callback = function(ev)
        vim.lsp.buf.format()
    end,
})
