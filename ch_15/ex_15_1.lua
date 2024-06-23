---Serialize tables 
---@param o any
---@param indent integer
function serialize(o, indent)
    local t = type(o)
    if t == "number" or t == "string" or t == "boolean" or t == "nil" then
        io.write(string.format("%q", o))
    elseif t == "table" then
        io.write("{\n")
        indent = indent + 1
        for k, v in pairs(o) do
            io.write(('  '):rep(indent) .. '"', k, '": ')
            serialize(v, indent)
            io.write(",\n")
        end
        io.write("}\n")
    else
        error("cannot serialize a " .. type(o))
    end
end

local exampleTable = {
    [1] = "apple",
    [2] = "banana",
    [3] = "cherry",
    x = "x-ray",
    y = "yellow",
}

-- serialize(exampleTable)
serialize({ a = 12, b = 'lua', key = 'another "one"', d = { m = true, y = true } }, 1)
