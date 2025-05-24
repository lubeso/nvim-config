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
        vim.lsp.enable("tilt_ls")
        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            group = vim.api.nvim_create_augroup("TiltfileDetection", { clear = true }),
            pattern = { "Tiltfile", "Tiltfile.*" },
            callback = function()
                vim.bo.filetype = "tiltfile"
            end,
        })
    end,
    dependencies = { "nvim-java/nvim-java" },
}
