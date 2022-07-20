local Mut = require("lib.mut")

return function(iter)
    local t = {
        __iter = iter,
        __peeked = Mut.from(),
    }

    t.next = function(self)
        return self.__peeked:take() or self.__iter:next()
    end

    t.peek = function(self)
        self.__peeked:replace(self.__iter:next())
        return self.__peeked:get()
    end

    return t
end
