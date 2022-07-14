return function(a, b)
    local t = {
        __a = a,
        __b = b,
    }

    function t:next()
        return self.__a:next() or self.__b:next()
    end

    return t
end
