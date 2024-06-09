-- Converts stdin into tempfile to be processed by each function
---@return file*
function get_stdin(filename)
    local tempfile = io.tmpfile()
    while true do
        local c = filename:read(1)
        if not c then break end
        tempfile:write(c)
    end
    tempfile:seek("set")
    return tempfile
end

-- Write data to stdout
---@param data table
function write_data(data) for i in pairs(data) do io.write(data[i]) end end

-- Copy tmpfile to stdout in byte chunks specified by size
---@param tempfile file*
---@param size integer
---@return table
function _read_byte_chunk(tempfile, size)
    local data = {}
    local count = 1
    while true do
        local content = tempfile:read(size)
        if not content then break end
        data[count] = content
        count = count + 1
    end
    return data
end

-- Copy tmpfile to stdout byte by byte
---@param tempfile file*
function byte_by_byte(tempfile)
    local data = _read_byte_chunk(tempfile, 1)
    write_data(data)
    tempfile:seek("set")
end

-- Copy tmpfile to stdout line by line
---@param tempfile file*
function line_by_line(tempfile)
    local data = {}
    local count = 1
    for line in tempfile:lines("l") do
        data[count] = line .. '\n'
        count = count + 1
    end
    write_data(data)
    tempfile:seek("set")
end

-- Copy tmpfile to stdout in chunks of 8kB
---@param tempfile file*
function chunks(tempfile)
    local data = _read_byte_chunk(tempfile, 2 ^ 13)
    write_data(data)
    tempfile:seek("set")
end

-- Copy tmpfile to stdout as whole file
---@param tempfile file*
function whole_file(tempfile)
    local data = {}
    data[1] = tempfile:read('a')
    write_data(data)
    tempfile:seek("set")
end

-- replace io.stdin with a file if local file has to be read
local tempfile = get_stdin(io.stdin)

io.write('\n\n\tWriting byte by byte:\n')
local start_time = os.clock()
byte_by_byte(tempfile)
io.write(string.format('\n\t Took %.4f', os.clock() - start_time))

io.write('\n\n\tWriting line by line:\n')
start_time = os.clock()
line_by_line(tempfile)
io.write(string.format('\n\t Took %.4f', os.clock() - start_time))

io.write('\n\n\tWriting chunks of 8kB:\n')
start_time = os.clock()
chunks(tempfile)
io.write(string.format('\n\t Took %.4f', os.clock() - start_time))

io.write('\n\n\tWriting whole file:\n')
start_time = os.clock()
whole_file(tempfile)
io.write(string.format('\n\t Took %.4f', os.clock() - start_time))
