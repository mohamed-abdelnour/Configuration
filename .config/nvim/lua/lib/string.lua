local Iterator = require("lib.iterator")

local M = string

function M:lines()
    return Iterator.from(self:gmatch("([^\n]*)\n?"))
end

function M:wrap(left, right)
    local wrapped = table.concat({ left or "[", "%1", right or "]" })
    return self:gsub("^.*$", wrapped)
end

return M
