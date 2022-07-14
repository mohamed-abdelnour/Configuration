return function(iter, separator)
    local t = {
        __iter = iter:peekable(),
        __separator = separator,
        __needs_sep = false,
    }

    function t:next()
        if self.__needs_sep and self.__iter:peek() then
            self.__needs_sep = false
            return self.__separator
        else
            self.__needs_sep = true
            return self.__iter:next()
        end
    end

    return t
end
