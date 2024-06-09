---Build sparse matrix with 0 and 1 randoms
---@param n integer table rows
---@param m integer table columns
---@param val integer? value to assign to values
---@return table
function build_sparse_matrix(n, m, val)
    local t = {}
    for i = 0, n do
        local row = {}
        t[i] = row
        for j = 0, m do row[j] = val or math.random(0, 1) end
    end
    return t
end

---Print a given matrix
---@param t table
function print_matrix(t)
    for _, row_t in ipairs(t) do
        for _, elem in ipairs(row_t) do
            if elem == 0 then elem = '-' end
            io.write(elem .. ' ')
        end
        io.write('\n')
    end
end

---Sum two sparse matrixes
---@param t1 table
---@param t2 table
---@return table
function sum_matrixes(t1, t2, x1, y1, x2, y2)
    local X = math.max(x1, x2)
    local Y = math.max(y1, y2)
    local res = build_sparse_matrix(X, Y, 0)
    for i = 0, X do
        for j = 0, Y do
            local val1, val2 = 0, 0
            if t1[i] then val1 = t1[i][j] or 0 end
            if t2[i] then val2 = t2[i][j] or 0 end
            res[i][j] = val1 + val2
        end
    end

    return res
end

-- coords of T1
X1 = tonumber(arg[1]) or 5
Y1 = tonumber(arg[2]) or 5
-- coords of T2
X2 = tonumber(arg[3]) or 5
Y2 = tonumber(arg[4]) or 5

local t1 = build_sparse_matrix(X1, Y1, nil)
local t2 = build_sparse_matrix(X2, Y2, nil)
print_matrix(t1)
print('-------------')
print_matrix(t2)

local res = sum_matrixes(t1, t2, X1, Y1, X2, Y2)
print('-------------')
print_matrix(res)
