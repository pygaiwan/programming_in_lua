MAX_QUEENS = 8
solution_found = false

function isplaceok (queens_placed, queen_number, column)
    for i = 1, queen_number - 1 do
        if (queens_placed[i] == column) or
        (queens_placed[i] - i == column - queen_number) or
        (queens_placed[i] + i == column + queen_number) then
            return false
        end
    end
    return true
end

function printsoluton (queens_placed)
    for i = 1, MAX_QUEENS do
        for j = 1, MAX_QUEENS do
            io.write(queens_placed[i] == j and "🌝" or "-", " ")
        end
        io.write('\n')
    end
    io.write('\n')
end

function addqueen (queens_placed, queen_number)
    if solution_found then
        return
    end

    if queen_number > MAX_QUEENS then
        printsoluton(queens_placed)
        solution_found = true
    else
        for column = 1, MAX_QUEENS do
            if isplaceok(queens_placed, queen_number, column) then
                queens_placed[queen_number] = column
                addqueen(queens_placed, queen_number+1)
            end
        end
    end
end

addqueen({}, 1)
        
