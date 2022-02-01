pcall(function()
    require("impatient").enable_profile()
end)

require("modules/init_autocommands")
require("modules/init_mappings")
require("modules/init_options")
require("modules/init_plugins")
