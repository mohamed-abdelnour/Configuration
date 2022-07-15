local Mut = require("lib.mut")

return function(iter)
    local t = {
        __iter = iter,
        __peeked = Mut.from(),
    }

    function t:next()
        return self.__peeked:take() or self.__iter:next()
    end

    function t:peek()
        self.__peeked:replace(self.__iter:next())
        return self.__peeked:get()
    end

    return t
end
