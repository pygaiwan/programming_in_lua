-- Sort the stream (file or stdin) by line and print it to stream (stdout or file)
-- request confirmation for output file overwrite.
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

---@param output file*
---@return boolean
function is_empty(output)
    local current = output:seek()
    local size = output:seek("end")
    output:seek("set", current)
    if size > 0 then return true else return false end
end


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
    if not is_empty(output) then
        io.write('Output file is not empty, overwrite? [y/n]:  ')
        local answer = io.read()
        if answer ~= 'y' then
            output = io.stdout
        end
    end


end
sort_stream(input, output)

if input ~= io.stdin then input:close() end
if output ~= io.stdout then output:close() end