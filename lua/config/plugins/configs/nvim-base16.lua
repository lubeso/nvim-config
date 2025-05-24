return {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme base16-grayscale-light]])
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        if handle ~= nil then
            local result = handle:read("*a")
            handle:close()
            if result:gsub("%s+", "") == "Dark" then
                vim.cmd([[colorscheme base16-grayscale-dark]])
            end
        end
    end,
}
