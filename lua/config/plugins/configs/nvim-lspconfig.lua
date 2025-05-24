return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("jsonls", {
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = "true" },
                },
            },
        })
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = { vim.env.VIMRUNTIME } },
                },
            },
        })
    end,
}
