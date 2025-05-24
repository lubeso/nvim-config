return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = { "b0o/schemastore.nvim" },
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_lspconfig()

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({
                    group = augroup,
                    buffer = bufnr,
                })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({
                            filter = function(_client)
                                return _client.name == "null-ls"
                            end,
                            bufnr = bufnr,
                        })
                    end,
                })
            end
        end)

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
                vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
                vim.keymap.set(
                    "n",
                    "gD",
                    "<Cmd>lua vim.lsp.buf.declaration()<CR>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "gi",
                    "<Cmd>lua vim.lsp.buf.implementation()<CR>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "go",
                    "<Cmd>lua vim.lsp.buf.type_definition()<CR>",
                    opts
                )
                vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
                vim.keymap.set(
                    "n",
                    "gs",
                    "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
                    opts
                )
                vim.keymap.set("n", "<F2>", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
                vim.keymap.set(
                    { "n", "x" },
                    "<F3>",
                    "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>",
                    opts
                )
                vim.keymap.set(
                    "n",
                    "<F4>",
                    "<Cmd>lua vim.lsp.buf.code_action()<CR>",
                    opts
                )
            end,
        })

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
    end,
}
