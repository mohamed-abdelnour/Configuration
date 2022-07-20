local M = {}

M.identity = function(t)
    return t
end

M.nop = function() end

M.unpack = table.unpack or unpack

return M
