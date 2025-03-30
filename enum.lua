local function Enum()
    return setmetatable({ __count = 0, __previous = nil }, {
        __index = function(t, k)
            t.__count = t.__count + 1
            t.__previous = k
            rawset(t, k, t.__count)
            return t
        end,
        __call = function(t, n, ...)
            if n then
                t.__count = n
                rawset(t, t.__previous, n)
            end
            return t
        end
    })
end
