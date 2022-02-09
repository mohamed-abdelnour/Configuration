local impatient = function()
    require("impatient").enable_profile()
end

local main = function()
    pcall(impatient)

    require("modules/init_autocommands")
    require("modules/init_functions")
    require("modules/init_icons")
    require("modules/init_mappings")
    require("modules/init_options")
    require("modules/init_plugins")
end

main()
