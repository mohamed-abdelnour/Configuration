local function impatient()
    require("impatient").enable_profile()
end

local function main()
    pcall(impatient)

    require("modules/init_autocommands")
    require("modules/init_mappings")
    require("modules/init_options")
    require("modules/init_plugins")
end

main()
