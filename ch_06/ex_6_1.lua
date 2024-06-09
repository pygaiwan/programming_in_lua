---@param x table
function print_array(x) print(table.unpack(x)) end

print_array({1, 2, 3, 4})
