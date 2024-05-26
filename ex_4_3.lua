-- Function to insert a string into another string at a specified position
---@param start_string string
---@param position number
---@param to_add string
---@return string
function insert (start_string, position, to_add)
    position = tonumber(position)
    if position > start_string:len() then
        print('Position is greater than len of the first string. Decreasing it\n')
        position = start_string:len() + 1
    elseif position < 1 then
        print('Position is lower than 1. Setting to 1\n')
        position = 1
    end

    start_part = start_string:sub(1, position-1)
    end_part = start_string:sub(position)
    return start_part .. to_add .. end_part
end

final_string = insert(arg[1], arg[2], arg[3])
print(final_string)