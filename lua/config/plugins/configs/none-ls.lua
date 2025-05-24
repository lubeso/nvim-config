return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "mason.nvim",
        "plenary.nvim",
    },
    opts = function(_, opts)
        local null_ls = require("null-ls")
        opts.root_dir = opts.root_dir or require("null-ls.utils").root_pattern(".git")
        opts.sources = vim.list_extend(opts.sources or {}, {
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.code_actions.proselint,
            null_ls.builtins.diagnostics.codespell,
            null_ls.builtins.diagnostics.stylelint,
            null_ls.builtins.formatting.stylua,
        })
    end,
}
