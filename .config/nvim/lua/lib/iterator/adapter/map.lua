return function(iter, f)
    local t = {
        __iter = iter,
        __f = f,
    }

    t.next = function(self)
        local item = self.__iter:next()
        return item and self.__f(item)
    end

    return t
end
