-- This is a work in progress and is not yet complete.
-- This should not be used.
-- This has not been tested and is not guaranteed to work.
-- This is a Lua module that provides an improved version of the enum functionality.

return function()
    return setmetatable({ __count = 0, __previous = 0, __members = {}, __values = {} }, {
        __index = function(t, k)
            if t.__members[k] then
                return t.__members[k]
            end

            if type(k) == "string" then
                t.__count = t.__count + 1
                t.__previous = k
                t.__members[k] = t.__count
                t.__values[t.__count] = k
            end

            if type(k) == "number" then
                return t.__values[k]
            end

            return t
        end,

        __call = function(t, n, ...)
            if n then
                t.__count = n
                t.__members[t.__previous] = n
                t.__values[t.__previous] = nil
                t.__values[n] = t.__previous
            end

            return t
        end,

        __newindex = function(t, k, v)
            if t.__members[k] then
                error("Cannot overwrite existing enum member: " .. k)
            end

            t.__members[k] = v
            t.__values[v] = k
            t.__count = v
            t.__previous = k
        end,

        __tostring = function(t)
            local str = "{ "
            for k, v in pairs(t.__members) do
                str = str .. k .. " = " .. v .. ", "
            end
            str = str:sub(1, -3) .. " }"
            return str
        end
    })
end
