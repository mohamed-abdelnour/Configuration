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

M.wrap = function(arg)
    local wrapped = table.concat({ arg.l or "[", "%1", arg.r or "]" })
    return arg.s:gsub("^.*$", wrapped)
end

return M
