---@param initial_string string
---@param position integer
---@param length integer
---@return string
function remove(initial_string, position, length)
    position = tonumber(position)
    length = tonumber(length)

    start_string = initial_string:sub(1, position - 1)
    end_string = initial_string:sub(position + length, -1)

    return start_string .. end_string
end

final_string = remove(arg[1], arg[2], arg[3])
print(final_string)
