---Insert all elements from a table to another table in a given position
---@param source_t table
---@param dest_t table
---@param position integer
function insert_in_table(source_t, dest_t, position)
    table.move(source_t, 1, #source_t, position, dest_t)
end

function print_table(dest_t) for k, v in ipairs(dest_t) do print(k, v) end end

source_t = {1, 2, 3, 4, 5}
dest_t = {7, 9, 2}
insert_in_table(source_t, dest_t, 2)
print_table(dest_t)
