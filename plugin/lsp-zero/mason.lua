local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "astro",
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "ts_ls",
    },
})
