vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 3
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
vim.g.netrw_alto = 0

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.compatible = false
if vim.v.version >= 600 then
    vim.api.nvim_exec2("filetype plugin indent on", { output = false })
    vim.o.expandtab = true
end

vim.keymap.set("n", "gl", "<Cmd>lua vim.diagnostic.open_float<CR>")
vim.keymap.set("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev<CR>")
vim.keymap.set("n", "]d", "<Cmd>lua vim.diagnostic.goto_next<CR>")

require("config.plugins.managers.lazy")
