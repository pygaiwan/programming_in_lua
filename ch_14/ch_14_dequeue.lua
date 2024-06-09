function list_new() return {first = 0, last = -1} end

function push_first(list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end

function push_last(list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end

function pop_first(list)
    local first = list.first
    if first > list.last then error('list is empty') end
    local value = list[first]
    list[first] = nil
    list.first = first + 1
    return value
end

function pop_last(list)
    local last = list.last
    if list.first > last then error('list is empty') end
    local value = list[last]
    list[last] = nil
    list.last = last - 1
    return value
end

l = list_new()
push_first(l, 5)
push_first(l, 6)
push_first(l, 7)
push_first(l, 8)

push_last(l, "a")
push_last(l, "b")
push_last(l, "c")

for i, c in pairs(l) do print(i, c) end
