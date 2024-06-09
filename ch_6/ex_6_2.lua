---@param ... any
---@return table "All elements of x expect the first"
function discard_first(...)
    local args = table.pack(...)
    local to_return = {}
    for i = 2, args.n do to_return[i - 1] = args[i] end
    return to_return
end

returned = discard_first(1, 'a', 'b', 'c', {9, 2, 3, 4}, nil, 'f')
print(table.unpack(returned))
