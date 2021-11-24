local functions = {}

function statusline(section)
    return table.concat({
        "[%{mode()}] %<%F %h%m%r %=",
        section or "",
        " (%l/%L, %c) [%p%%]",
    })
end

return functions
