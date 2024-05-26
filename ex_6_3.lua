---@param ... any
---@return table "All elements of ... except last one"
function discard_last (...)
    local arg = table.pack(...)
    local to_return = {}
    for i=1, arg.n -1 do
        to_return[i] = arg[i]
    end
    return to_return
end

returned = discard_last(1, 'a', 'b', 'c', {9, 2, 3 ,4}, nil, 'f')
print(table.unpack(returned))