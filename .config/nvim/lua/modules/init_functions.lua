local M = {}

function M.trim_wrap(string, left, right)
    local wrapped = table.concat({ left or "[", "%1", right or "]" })
    return string:gsub("^%s*(..-)%s*$", wrapped)
end

function M.extend(source, destination)
    for _, v in ipairs(destination) do
        table.insert(source, v)
    end
    return source
end

function M.merge(tables)
    local result = {}
    for _, table in ipairs(tables) do
        result = M.extend(result, table)
    end
    return result
end

return M
