local M = {}

local api = vim.api

M.buffer = {
    del_coq_marks = function()
        local BUFFER = 0
        for ns, ns_id in pairs(api.nvim_get_namespaces()) do
            if M.str.is_uuid(ns) then
                local marks = api.nvim_buf_get_extmarks(BUFFER, ns_id, 0, -1, {})
                for _, mark in ipairs(marks) do
                    for _, id in ipairs(mark) do
                        api.nvim_buf_del_extmark(BUFFER, ns_id, id)
                    end
                end
            end
        end
    end,
}

M.byte = {
    is_hex = function(b)
        local ZERO = 48
        local A_UPPER = 65
        local A_LOWER = 97

        local bytes = {
            { ZERO, ZERO + 9 },
            { A_UPPER, A_UPPER + 5 },
            { A_LOWER, A_LOWER + 5 },
        }

        return M.tbl.any(function(bounds)
            return M.num.in_range_inc(b, bounds[1], bounds[2])
        end, bytes)
    end,
}

M.num = {
    in_range_inc = function(x, low, high)
        return x >= low and x <= high
    end,
}

M.str = {
    UUID_LENGTH = 32,

    is_hex = function(s)
        for i = 1, #s do
            if not M.byte.is_hex(s:byte(i)) then
                return false
            end
        end
        return true
    end,

    wrap = function(arg)
        local wrapped = table.concat({ arg.l or "[", "%1", arg.r or "]" })
        return arg.s:gsub("^.*$", wrapped)
    end,
}

M.str.is_uuid = function(s)
    return #s == M.str.UUID_LENGTH and M.str.is_hex(s)
end

M.tbl = {
    any = function(f, t)
        for _, v in ipairs(t) do
            if f(v) then
                return true
            end
        end
        return false
    end,

    extend = function(source, destination)
        for _, v in ipairs(destination) do
            table.insert(source, v)
        end
        return source
    end,

    intersperse = function(t, separator)
        local r = {}
        local length = #t
        for i = 1, length - 1 do
            table.insert(r, t[i])
            table.insert(r, separator)
        end
        table.insert(r, t[length])
        return r
    end,
}

M.tbl.all = function(f, t)
    local g = function(v)
        return not f(v)
    end
    return not M.tbl.any(g, t)
end

M.tbl.merge = function(ts)
    local r = {}
    for _, t in ipairs(ts) do
        r = M.tbl.extend(r, t)
    end
    return r
end

M.toggles = {
    spaceless = function()
        local spaceless = { group = "Spaceless" }
        if next(api.nvim_get_autocmds(spaceless)) == nil then
            package.loaded.spaceless.setup()
        else
            api.nvim_clear_autocmds(spaceless)
        end
    end,
}

return M
