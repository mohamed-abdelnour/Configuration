local impatient = function()
    require("impatient").enable_profile()
end

local use_modules = function(modules)
    for _, v in ipairs(modules) do
        require("modules." .. v)
    end
end

local main = function()
    pcall(impatient)

    use_modules({
        "autocommands",
        "diagnostic",
        "functions",
        "icons",
        "lsp",
        "mappings",
        "options",
        "telescope",
        "term",
        -- Call require("modules.plugins") last.
        "plugins",
    })
end

main()
