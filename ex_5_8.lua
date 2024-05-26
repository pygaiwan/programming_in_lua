---Replication of table.concat
---@param t table "Table of strings"
---@return string
function concat(t)
    s = ''
    for _, v in pairs(t) do
        s = s .. v
    end
    return s
end

source_t = {}
for i=1, 100000 do source_t[i] = tostring(i) end
-- print(concat(source_t))
print(table.concat(source_t))