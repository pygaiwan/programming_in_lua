function reps(x) return function() x = x + 500000; return x end end

function old_trim(s) return s:gsub("^%s+(.-)%s+$", "%1") end
function new_trim(s) return s:gsub("^%s+", ""):gsub("%s+$", "") end

function linear_trim(s)
    local start_index = 1
    local end_index = #s

    while start_index <= end_index and s:sub(start_index, start_index):match("%s") do
        start_index = start_index + 1
    end

    while end_index >= start_index and s:sub(end_index, end_index):match("%s") do
        end_index = end_index - 1
    end

    return s:sub(start_index, end_index)
end

local x = reps(1000000)
print('\t\tOLD TRIM:')
for _=0, 5 do
    local t0 = os.clock()
    local val = x()
    old_trim(('    i have made a trim function   '):rep(val, '\n'))
    print(string.format('Took %.5f seconds with %d', os.clock() - t0, val))
end

local x = reps(1000000)
print('\n\t\tNEW TRIM:')
for _=0, 5 do
    local t0 = os.clock()
    local val = x()
    new_trim(('    i have made a trim function   '):rep(val, '\n'))
    print(string.format('Took %.5f seconds with %d', os.clock() - t0, val))
end

local x = reps(1000000)
print('\n\t\tLINEAR TRIM:')
for _=0, 5 do
    local t0 = os.clock()
    local val = x()
    linear_trim(('    i have made a trim function   '):rep(val, '\n'))
    print(string.format('Took %.5f seconds with %d', os.clock() - t0, val))
end