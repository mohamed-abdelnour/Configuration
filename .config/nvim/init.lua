local impatient = function()
    require("impatient").enable_profile()
end

local use_modules = function(modules)
    for _, v in ipairs(modules) do
        require("modules/init_" .. v)
    end
end

local main = function()
    pcall(impatient)

    vim.g.did_load_filetypes = 0
    vim.g.do_filetype_lua = 1

    use_modules({
        "autocommands",
        "diagnostic",
        "functions",
        "icons",
        "lsp",
        "mappings",
        "options",
        "term",
        -- Call require("modules/init_plugins") last.
        "plugins",
    })
end

main()
