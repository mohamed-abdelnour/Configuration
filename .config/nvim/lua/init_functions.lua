local functions = {}

local function call_or(f, default)
    return (f and f()) or (default or false)
end

local function make_section(f)
    return call_or(f, "") .. " "
end

function statusline()
    return table.concat({
        "[%{mode()}] %<%F %h%m%r %=",
        make_section(treesitter_section),
        make_section(lsp_section),
        "(%l/%L, %c) [%p%%]",
    })
end

return functions
