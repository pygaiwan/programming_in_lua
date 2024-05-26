-- Sort the file line by line and print it
---@param input file*
---@param output file*
function sort_stream(input, output)
    local t = {}
    local count = 0
    for line in input:lines() do
        count = count + 1
        t[count] = line
    end

    table.sort(t)

    for i = 1, count do
        output:write(t[i] .. '\n')
    end
end

function main()
    local input = io.stdin
    local output = io.stdout
    if arg[1] then
        input = io.open(arg[1], 'r')
        if not input then
            error('Cannot open input file: ' .. arg[1])
        end
    end
    if arg[2] then
        output = io.open(arg[2], 'w')
        if not output then
            error('Cannot open input file: ' .. arg[1])
        end
    end
    sort_stream(input, output)

    if input ~= io.stdin then input:close() end
    if output ~= io.stdout then output:close() end
end

main()