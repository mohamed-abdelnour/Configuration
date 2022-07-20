local Mut = require("lib.mut")

return function(value)
    local t = { __value = Mut.from(value) }

    t.next = function(self)
        return self.__value:take()
    end

    return t
end
