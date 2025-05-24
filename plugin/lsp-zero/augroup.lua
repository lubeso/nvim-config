local lsp_zero = require("lsp-zero")

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
