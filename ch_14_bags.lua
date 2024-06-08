
function Bag(list)
    local bag = {}
    for i, e in ipairs(list) do
        bag[e] = (bag[e] or 0) + 1
    end
    return bag
end

function insert_bag(bag, element)
    bag[element] = (bag[element] or 0) + 1
    return bag
end

function remove_bag(bag, element)
    local count = bag[element]
    bag[element] = (count and count > 1) and count - 1 or nil
    return bag
end

bag = Bag { 1, 2, 3, 4, 1, 2, 1, 2, 1, 3 }
insert_bag(bag, 4)
insert_bag(bag, 5)
remove_bag(bag, 4)
for i, e in ipairs(bag) do print(i, e) end

