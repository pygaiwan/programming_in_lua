--- Helper function to print a table
local function print_table(t)
    for _, v in ipairs(t) do
        io.write(v, " ")
    end
    io.write('\n')
end

--- Recursive function to generate all combination
---@param arr table: The input array
---@param n integer: Number of elements in the array
---@param m integer: Number of elements in the combination
---@param index integer: Current index in the array
---@param data table: Temp table to store the combinations
---@param i integer: Current index in the data array
local function combinations(arr, n, m, index, data, i)
    if i == m then print_table(data) return end
    if index > n then return end

    data[i] = arr[index]
    combinations(arr, n, m, index + 1, data, i + 1)
    combinations(arr, n, m, index + 1, data, i)
end

local function print_combinations(arr, m)
    local data = {}
    combinations(arr, #arr, m + 1, 1, data, 1)
end

print_combinations({1, 2, 3, 4}, 2)