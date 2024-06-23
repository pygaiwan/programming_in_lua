local function file_as_array(f_name)
    local proxy = {}

    local f = io.open(f_name)
    if not f then error('File cannot be opened') end

    local content = f:read("a")
    f:close()

    for i = 1, #content do
        proxy[i] = content:sub(i, i)
    end

    local mt = {

        __index = function(_, i)
            if i > #proxy then return nil end
            return proxy[i]
        end,

        __newindex = function(_, i, v)
            if i > #proxy then return nil end
            proxy[i] = v
        end
    }

    setmetatable(proxy, mt)
    return proxy
end


local f = file_as_array('example.txt')
print(f[1])
f[1] = 'x'
print(f[1])
