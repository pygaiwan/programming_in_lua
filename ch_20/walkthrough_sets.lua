local Set = {}
local mt = {}


function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end
    return set
end

function Set.union(a, b)
    local res = Set.new({})
    for k in ipairs(a) do res[k] = true end
    for k in ipairs(b) do res[k] = true end
    return res
end

function Set.intersection(a, b)
    local res = Set.new({})
    for k in pairs(a) do res[k] = b[k] end
    return res
end

function Set.tostring(set)
    local l = {}
    for e in pairs(set) do l[#l + 1] = tostring(e) end
    return "{" .. table.concat(l, ',') .. "}"
end

mt.__add = Set.union
mt.__mul = Set.intersection

mt.__le = function(a, b)
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end

mt.__lt = function(a, b) return a <= b and not (b <= a) end

mt.__eq = function(a, b) return a <= b and b <= a end
mt.__tostring = Set.tostring


local a = { 1, 2, 3, 4, 8, 4, 2, 1 }
local x = Set.new(a)
local y = Set.new({ 1, 9, 4, 2, 0 })

print(x)
print(y)
local res = Set.union(x, y)
print(res)
local res2 = x + y
print(res2)

