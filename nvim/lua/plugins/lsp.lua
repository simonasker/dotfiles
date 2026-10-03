vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "standard",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticsMode = "workspace",
            }
        }
    }
})

vim.lsp.enable({
    "basedpyright",
    "ruff",
})

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = {
        current_line = true,
    }
})
