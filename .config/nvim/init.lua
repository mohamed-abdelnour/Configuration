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

    Error:notifier(function(err)
        return vim.api.nvim_echo({ { err, "ErrorMsg" } }, false, {})
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
        local result
        Error:guard(function()
            result = use("modules.")(module)
        end)
        return result
    end

    Table.from({
        "autocommands",
        "icons",
        "lsp",
        "mappings",
        "options",
        "telescope",
        "term",
    })
        :iter()
        :for_each(use_module)

    local plugins = use_module("plugins")

    if not plugins.bootstrapped then
        Error:report()
    end
end

main()
