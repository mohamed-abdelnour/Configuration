local M = {}

function M.identity(t)
    return t
end

function M.nop() end

M.unpack = table.unpack or unpack

return M
