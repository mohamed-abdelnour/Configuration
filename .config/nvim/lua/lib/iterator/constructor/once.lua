local Mem = require("lib.mem")

return function(value)
    local t = { __value = Mem.from(value) }

    function t:next()
        return self.__value:take()
    end

    return t
end
