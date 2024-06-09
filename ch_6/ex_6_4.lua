---@param x table
---@return table "Shuffled table - implemented with Fisher-Yates Shuffle Algorithm."
function shuffle(x)
    math.randomseed(os.time())

    for i = #x, 2, -1 do
        local j = math.random(i)

        x[i], x[j] = x[j], x[i]

    end
    return x
end

returned = shuffle({1, 2, 3, 4, 5, 6, 7, 8, 9})
print(table.unpack(returned))
