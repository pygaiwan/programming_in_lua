function basic_serialize (o)
    return string.format("%q", o)
end

function save(name, value, saved)
    saved = saved or {}
    io.write(name, ": ")
    if type(value) == "number" or type(value) == "string" or type(value) == "boolean" then
        io.write(basic_serialize(value), "\n")
    elseif type(value) == "table" then
        if saved[value] then
            io.write(saved[value], "\n")
        else
            saved[value] = name
            io.write("{}\n")
            for k, v in pairs(value) do
                k = basic_serialize(k)
                local fname = string.format("%s[%s]", name, k)
                save(fname, v, saved)
            end
        end
    else
        error("cannot save a " .. type(value))
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
exampleTable = {a=12, b='lua', key='another "one"', d={m= true, y= true}}
save('m', exampleTable)

