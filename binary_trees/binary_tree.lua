local Node = {}
Node.__index = Node

function Node.new(value)
    local self = setmetatable({}, Node)

    self.value = value
    self.left = nil
    self.right = nil
    return self
end

local function size(node)
    local s = 1
    local s_left = 0
    local s_right = 0
    if node.left then s_left = size(node.left) end
    if node.right then s_right = size(node.right) end

    return s_left + s_right + s
end

local function depth(node)
    local d = 1
    local d_left = 0
    local d_right = 0
    if node.left then d_left = depth(node.left) end
    if node.right then d_right = depth(node.right) end

    local d_subnode = (d_left > d_right) and d_left or d_right

    return d + d_subnode
end

local function max_element(node)
    local max = node.value
    local max_left = 0
    local max_right = 0
    if node.left then max_left = max_element(node.left) end
    if node.right then max_right = max_element(node.right) end


    local max_node = (max_left > max_right) and max_left or max_right
    max = (max_node > max) and max_node or max
    return max
end

local function equal_trees(node1, node2)
    local root = false
    if node1 and node2 then root = node1.value == node2.value end

    local left = root
    local right = root
    if node1.left then left = equal_trees(node1.left, node2.left) end
    if node1.right then right = equal_trees(node1.right, node2.right) end
    return root and left and right
end


local root = Node.new(10)
root.left = Node.new(3)
root.right = Node.new(15)
root.left.left = Node.new(3)
root.left.right = Node.new(7)
root.right.left = Node.new(12)
root.right.right = Node.new(20)

local root2 = Node.new(10)
root2.left = Node.new(3)
root2.right = Node.new(15)
root2.left.left = Node.new(3)
root2.left.right = Node.new(7)
root2.right.left = Node.new(12)
root2.right.right = Node.new(20)

local root3 = Node.new(10)
root3.left = Node.new(3)
root3.right = Node.new(15)
root3.left.left = Node.new(3)
root3.left.right = Node.new(7)
root3.right.left = Node.new(13)
root3.right.right = Node.new(20)



print('Value of root node: ', root.value)
print('Size: ', size(root))
print('Depth: ', depth(root))
print('Max element: ', max_element(root))
print('Trees are equal: ', equal_trees(root, root2))
print('Trees are equal: ', equal_trees(root, root3))
