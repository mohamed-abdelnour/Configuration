local Iterator = require("lib.iterator")

local M = string

M.EXPANDED_TAB = "    "

M.expand_tabs = function(self)
    return self:gsub("\t", M.EXPANDED_TAB)
end

M.lines = function(self)
    return Iterator.from(self:gmatch("([^\n]*)\n?"))
end

M.wrap = function(self, left, right)
    local wrapped = table.concat({ left or "[", "%1", right or "]" })
    return self:gsub("^.*$", wrapped)
end

return M
