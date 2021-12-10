function call_or(f, default)
    return (f and f()) or (default or false)
end

function trim_wrap(string, left, right)
    wrapped = table.concat({ left or "[", "%1", right or "]" })
    return string:gsub("^%s*(..-)%s*$", wrapped)
end
