require("config.plugins.managers.lazy.bootstrap")

require("lazy").setup({
    spec = {
        require("config.plugins.configs.lsp-zero"),
        require("config.plugins.configs.none-ls"),
        require("config.plugins.configs.nvim-base16"),
        require("config.plugins.configs.nvim-cmp"),
        require("config.plugins.configs.nvim-lspconfig"),
        require("config.plugins.configs.nvim-treesitter"),
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "lewis6991/gitsigns.nvim",
        "nvim-java/nvim-java",
        "nvim-lua/plenary.nvim",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    checker = { enabled = true },
})
