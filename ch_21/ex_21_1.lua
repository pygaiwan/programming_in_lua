Stack = { items = {} }

function Stack:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.__tostring = function(s)
        local ret = ''
        for _, k in ipairs(s.items) do ret = ret .. k .. '\n' end
        return ret
    end
    return o
end

function Stack:pop()
    if #self.items == 0 then return nil end
    return table.remove(self.items)
end

function Stack:push(v) self.items[#self.items + 1] = v end

function Stack:isempty() return #self.items > 0 or false end

function Stack:top()
    if #self.items == 0 then return nil end
    return self.items[#self.items]
end

function Stack:len()
    return #self.items
end

StackQueue = Stack:new()
function StackQueue:insertbottom(v)
    table.move(self.items, 1, #self.items, 2)
    self.items[1] = v
end

local stack = Stack:new()

stack = Stack:new({ items = { 1, 2, 3, 4 } })
print(stack:pop())
stack:push(9)
print(stack:pop())
print(stack)
print(stack:isempty())
print(stack:top())


stackq = StackQueue:new({ items = { 1, 2, 3 } })
stackq:push(4)
stackq:insertbottom(0)
print(stackq)
