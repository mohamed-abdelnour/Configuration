local M = {}

M.all = function(f, t)
    local g = function(v)
        return not f(v)
    end
    return not M.any(g, t)
end

M.any = function(f, t)
    for _, v in ipairs(t) do
        if f(v) then
            return true
        end
    end
    return false
end

M.extend = function(source, destination)
    for _, v in ipairs(destination) do
        table.insert(source, v)
    end
    return source
end

M.intersperse = function(t, separator)
    local r = {}
    local length = #t
    for i = 1, length - 1 do
        table.insert(r, t[i])
        table.insert(r, separator)
    end
    table.insert(r, t[length])
    return r
end

M.merge = function(ts)
    local r = {}
    for _, t in ipairs(ts) do
        r = M.extend(r, t)
    end
    return r
end

M.trim_wrap = function(string, left, right)
    local wrapped = table.concat({ left or "[", "%1", right or "]" })
    return string:gsub("^%s*(..-)%s*$", wrapped)
end

return M
