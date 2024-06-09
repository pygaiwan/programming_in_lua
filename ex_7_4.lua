--- Read the last n lines of a file without traversing the whole file
--- Union of exercise 7.4 and 7.5
---@param fd file*
---@param n integer 'number of lines to return'
---@param position integer 'end of file'
---@return integer 'new position to start reading from'
function print_last_n_lines(fd, n, position)
    local line_count = 0

    while position > 0 and line_count <= n do
        position = position - 1
        fd:seek("set", position)

        if fd:read(1) == '\n' then line_count = line_count + 1 end

    end
    return position
end

function main(lines)
    local file = io.open('gulliver.txt', 'r')
    if not file then error('fail to open file') end

    local file_size = file:seek("end")
    local position = print_last_n_lines(file, lines, file_size)
    if position < file_size then
        file:seek('set', position + 1)
    else
        file:seek('set')
    end

    local content = file:read('a')
    print(content)
    file:close()
end

main(1)
