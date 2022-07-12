local M = string

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
