---Read exclusion file and return the content in table
---@return table
function read_exclusions()
    local exclude_words = {}
    f = io.open('exclusions.txt', 'r')
    if not f then error('cannot read file') end

    for line in f:lines() do exclude_words[line] = true end
    f:close()
    return exclude_words
end

local exclude_words = read_exclusions()
local counter = {}
for line in io.lines() do
    for word in string.gmatch(line, '%w+') do
        if not exclude_words[word] then counter[word] = (counter[word] or 0) + 1 end
    end
end

local words = {}
for w in pairs(counter) do words[#words + 1] = w end

table.sort(words, function(w1, w2)
    return counter[w1] > counter[w2] or counter[w1] == counter[w2] and w1 < w2
end)

local n = math.min(tonumber(arg[1]) or math.huge, #words)

for i = 1, n do io.write(words[i], '\t', counter[words[i]], '\n') end
