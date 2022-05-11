local root = require("jdtls/setup").find_root({ "gradlew", ".git" })

local workspace = table.concat({
    os.getenv("XDG_DATA_HOME"),
    "/java/jdtls/workspace/",
    vim.fn.fnamemodify(root, ":p:h:t"),
})

local setup = require("modules/lsp").lsp_setup({
    cmd = { "jdtls", "-data", workspace },
})

require("jdtls").start_or_attach(setup)
