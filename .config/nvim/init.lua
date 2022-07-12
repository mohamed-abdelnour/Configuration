local use = function(prefix)
    return function(module)
        return require(prefix .. module)
    end
end

local main = function()
    local use_lib = use("lib.")

    Table = use_lib("table")

    Table.from({
        { "Error", "error" },
        { "Iterator", "iterator" },
    })
        :iter()
        :for_each(function(arg)
            -- selene: allow(global_usage)
            _G[arg[1]] = use_lib(arg[2])
        end)

    Error:guard(function()
        require("impatient").enable_profile()
    end)

    Table.from({
        "string",
        "vim",
    })
        :iter()
        :for_each(use_lib)

    local use_module = function(module)
        Error:guard(function()
            use("modules.")(module)
        end)
    end

    Table.from({
        "autocommands",
        "icons",
        "lsp",
        "mappings",
        "options",
        "telescope",
        "term",
        -- Call require("modules.plugins") last.
        "plugins",
    })
        :iter()
        :for_each(use_module)

    Error:report()
end

main()
