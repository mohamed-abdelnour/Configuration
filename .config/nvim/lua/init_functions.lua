local M = {}

function M.call_or(f, default)
    return (f and f()) or (default or false)
end

function M.trim_wrap(string, left, right)
    wrapped = table.concat({ left or "[", "%1", right or "]" })
    return string:gsub("^%s*(..-)%s*$", wrapped)
end

return M
