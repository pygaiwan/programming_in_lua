---Return polinomial value from a polinomial table and value of x
---@param polinomial table
---@param x integer
---@return integer
function polinomial_value(polinomial, x)
    local res = 0
    for exp, coeff in ipairs(polinomial) do
        res = res + coeff * (x ^ (exp-1))
    end
    return res
end

print(polinomial_value({3, 0, 1}, 0))
print(polinomial_value({3, 0, 1}, 5))
print(polinomial_value({3, 0, 1}, 10))

print(polinomial_value({7, -5, 2, 3}, 2))
