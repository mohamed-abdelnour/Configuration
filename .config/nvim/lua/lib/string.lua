local Iterator = require("lib.iterator")

local M = string

M.lines = function(self)
    local done = false
    local last = Iterator.from(function()
        if not done then
            done = true
            return self:match("([^\n]+)$")
        end
    end)
    return Iterator.from(self:gmatch("(.-)\n")):extend(last)
end

M.shell_expand = function(self)
    if self then
        local handle = io.popen(table.concat({ "shell_expand", self }, " "))
        local data = handle:read("a")
        handle:close()
        return data
    end
end

M.wrap = function(self, left, right)
    local wrapped = table.concat({ left or "[", "%1", right or "]" })
    return self:gsub("^.*$", wrapped)
end

return M
