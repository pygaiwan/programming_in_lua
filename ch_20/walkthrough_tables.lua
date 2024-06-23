function set_default(t, d)
    local mt = { __index = function() return d end }
    setmetatable(t, mt)
end

tab = { x = 10, y = 20 }
print(tab.x, tab.z)

set_default(tab, 0)
print(tab.x, tab.z)


function track(t)
    local proxy = {}

    local mt = {
        __index = function(_, k)
            print('*access to element ' .. tostring(k))
            return t[k]
        end,

        __newindex = function(_, k, v)
            print('*updating of element ' .. tostring(k) .. ' with ' .. tostring(v))
            t[k] = v
        end,

        __pairs = function()
            return function(_, k)
                local nextkey, nextvalue = next(t, k)
                if nextkey ~= nil then print('*traversing element ' .. tostring(nextkey)) end
                return nextkey, nextvalue
            end
        end,

        __len = function() return #t end

    }

    setmetatable(proxy, mt)
    return proxy
end

t = {}
t = track(t)

t[2] = "hello" 
print(t[2])

for k, v in pairs(t) do print(k, v) end
