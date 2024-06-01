function polinomial_value(polinomial)
    return function (x)
        local res = 0
        for exp, coeff in ipairs(polinomial) do
            res = res + coeff * (x ^ (exp-1))
        end
        return res
    end
end

f = polinomial_value({3, 0 , 1})
print(f(0))
print(f(5))
print(f(10))

f = polinomial_value({7, -5, 2, 3})
print(f(2))

