local impatient = function()
    require("impatient").enable_profile()
end

local load_modules = function(modules)
    for _, v in ipairs(modules) do
        require("modules/init_" .. v)
    end
end

local main = function()
    pcall(impatient)

    load_modules({
        "autocommands",
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
